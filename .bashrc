# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Adding personal programs and scripts to PATH
export PATH="$HOME/bin:$HOME/scripts:$PATH"

# Create the config directory if doesn't exist
#bash_config="$HOME/.config/bash"
#if [ ! -d $bash_config ]; then
#  echo "Create BASH config directory $bash_config"
#  mkdir -p $bash_config
#fi

# KEYS
# ----

bind 'set bind-tty-special-chars off'

# ^Backspace
bind '"\C-h": shell-backward-kill-word'

# ^U delete full line
bind '"\C-u": kill-whole-line'

# MISC
# ----

# No beep
bind 'set bell-style none'

# > cannot overwrite a file. You have to do >! . Unless the file is empty
set -o noclobber

# Do not allow flow control (^S ^Q)
stty -ixon


# Do not exit on end-of-file.  Require the use of exit or logout instead.
# However,  ten  consecutive EOFs will cause the shell to exit anyway,
# to avoid the shell hanging if its tty goes away.
export IGNOREEOF="10"

# report status of job asynchronously
set -o notify

# HISTORY
# -------

HISTFILE="$HOME/.bash_history"
HISTSIZE=10000
SAVEHIST=10000

# Do not record an event starting with a space.
HISTCONTROL="ignorespace"

# AUTOCOMPLETION
# --------------

# case-insensitive
bind 'set completion-ignore-case On'

# add color when completing files / directories
bind 'set colored-stats on'

# FILESYSTEM NAVIGATION
# ---------------------

# Push the current directory visited on the stack.
alias cd="pushd"
# Do not store duplicates in the stack.
function dedup(){
    declare -a new=() copy=("${DIRSTACK[@]:1}")
    declare -A seen
    local v i
    seen[$PWD]=1
    for v in "${copy[@]}"
    do if [ -z "${seen[$v]}" ]
       then new+=("$v")
            seen[$v]=1
       fi
    done
    dirs -c
    for ((i=${#new[@]}-1; i>=0; i--))
    do      builtin pushd -n "${new[i]}" >/dev/null
    done
}
# Do not print the directory stack after pushd or popd.
function pushd() {
  command pushd "$@" >/dev/null
  dedup
}
function popd() {
  command popd "$@" >/dev/null
}

# d will display the directory stack,
# you can then move in the stack using 1 to 9 as aliases
max_alias_stack=9
alias d="dirs -v | tail -n +2 | head -n $max_alias_stack"
for index in $(seq 1 $max_alias_stack);
do
    alias "$index"="cd ~${index}";
done

# PROMPT
# ------

# without bold nor colors
# PS1="╭─[bash][\j] \u@\H \w/\n╰─▶ "

# https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
#"\033[XXXm
# Bold No color
# PS1="╭─\033[1m[bash][\j]\033[m \033[1m\u@\H\033[m \033[1m\w/\n\033[m╰─\033[1m▶\033[m "
# Full color prompt
PS1="╭─\033[1m[bash][\j]\033[m \033[1;32m\u@\H\033[m \033[34;1m\w/\n\033[m╰─\033[1m▶\033[m "

# ALIASES
# -------

alias reload="source ~/.bashrc"
source "$HOME/.aliases"

