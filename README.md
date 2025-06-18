# Dotfiles

## Content

### Core
- Arch based (EndeavourOS) / X11
- i3wm
- zsh
- neovim

### Secondary

I also try to keep up to date a few configs that I use less often
- vim
- tcsh
- bash

## Deploy

With stow and dotfiles in `~/git/dotfiles`:

```
> cd ~/git
> git clone "$repolink" "dotfiles"
# stow from one below $HOME. No overwrite allowed with this command.
> stow --target="dotfiles"
```
