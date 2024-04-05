# good resource: https://thevaluable.dev/zsh-install-configure-mouseless/

# Adding personal programs and scripts to PATH
typeset -U path PATH
path=($HOME/bin $HOME/scripts $path)
export PATH

# Create the config directory if doesn't exist
local zsh_config="$HOME/.config/zsh"
if [ ! -d $zsh_config ]; then
    echo "Create ZSH config directory $zsh_config"
    mkdir -p $zsh_config
fi

# KEYS
# ----

# Del
bindkey "^[[3~" delete-char

# ^Del and ^Backspace
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word

# ^-Left and ^-Right
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# MISC
# ----

# No beep
unsetopt  beep

# > cannot overwrite a file. You have to do >! . Unless the file is empty
unsetopt clobber
setopt clobber_empty

# >> create the file if it does not exist
setopt append_create

# Do not allow flow control (^S ^Q)
unsetopt flow_control

# Do not exit on end-of-file.  Require the use of exit or logout instead.
# However,  ten  consecutive EOFs will cause the shell to exit anyway,
# to avoid the shell hanging if its tty goes away.
setopt ignore_eof

# Allow comment in interactive shell
setopt interactive_comments

# report status of job asynchronously
setopt notify

# HISTORY
# -------

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# Do not record an event starting with a space.
setopt hist_ignore_space
# remove useless blank from command
setopt hist_reduce_blanks

# Search history with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# AUTOCOMPLETION
# --------------

autoload -U compinit && compinit
zmodload -i zsh/complist

# case-insensitive / not only prefix matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# add color when completing files / directories
# make sure LS_COLOR is set
eval "dircolors >! $zsh_config/ls_colors" && source "$zsh_config/ls_colors";
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Highlight current selection
zstyle ':completion:*' menu select

# Autoselect first match
setopt menu_complete

# Include hidden files in autocomplete
_comp_options+=(globdots)

# FILESYSTEM NAVIGATION
# ---------------------

# never print directory after cd (including cd - or cd stackentry)
setopt cd_silent
# Push the current directory visited on the stack.
setopt auto_pushd
# Do not store duplicates in the stack.
setopt pushd_ignore_dups
# Do not print the directory stack after pushd or popd.
setopt pushd_silent
# pushd without args go to home
setopt pushd_to_home

# d will display the directory stack,
# you can then move in the stack using 1 to 9 as aliases
local max_alias_stack=9
alias d="dirs -v | tail -n +2 | head -n $max_alias_stack"
for index ({1..$max_alias_stack}) alias "$index"="cd +${index}"; unset index;

# bd : go back to a parent directory, support completion
local bd_src="$zsh_config/zsh-bd/bd.zsh"
if [[ -a $bd_src ]]; then
    source $bd_src
else
    echo "Installing bd plugin"
    git clone "https://github.com/Tarrasch/zsh-bd.git" "$zsh_config/zsh-bd" &&
    source $bd_src
fi

# k : better ls -l, with git status of file & directories
local k_src="$zsh_config/zsh-k/k.sh"
if [[ -a $k_src ]]; then
    source $k_src
else
    echo "Installing k plugin"
    git clone "https://github.com/supercrabtree/k" "$zsh_config/zsh-k"
    source $k_src
fi

# PROMPT
# ------

autoload colors && colors
local user_host="%B%(!.%{$fg[red]%}.%{$fg[green]%})%n@%m%{$reset_color%}%b"
local current_dir="%B%{$fg[blue]%}%~/%{$reset_color%}%b"
local return_code="%B%(?..%{$fg[red]%}%? ↵)%{$reset_color%}%b"
local current_jobs="%B%(1j.%{$fg[blue]%}(%j jobs).)%{$reset_color%}%b"

NEWLINE=$'\n' # Avoid issue with redraw
PROMPT="╭─${user_host} ${current_dir}${NEWLINE}╰─%B▶%b "
RPROMPT="${return_code} ${current_jobs}"

# ALIASES
# -------

alias 'reload'='source $HOME/.zshrc'
source "$HOME/.aliases"

# Syntax Highlighting - must be loaded last
local syntax_hl_src="$zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [[ -a $syntax_hl_src ]]; then
    source $syntax_hl_src
else
    echo "Installing Syntax Highlighting plugin"
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$zsh_config/zsh-syntax-highlighting/" &&
    source $syntax_hl_src
fi
