# Dotfiles

## Usage

With stow and dotfiles in `~/git/dotfiles`:

```
> cd ~/git
> git clone "$repolink" "dotfiles"
# stow from one below $HOME. No overwrite allowed with this command.
> stow --target="dotfiles"
```

## Content

### Shells

I have configs for `zsh`, `bash`, and `tcsh`. (no oh-my-zsh framework).

No oh-my-zsh. I did not resist a few external scripts for zsh: `zsh-bd` to easily go to a parent directory,
`k` for a git info on ll, and `zsh-syntax-highlighting` for ... syntax highlighting in shell.

### i3-wm

The full config isn't under revision control. Base is the endeavouros i3-wm install (2024-03-28), all files that are
not included stayed un-touched from this base.

Will try to dig deeper and make my own full config. But, hey, it works great like that.

I did forgot to include `rofi` and `picom` here at first


### Neovim

No "neovim distribution".

