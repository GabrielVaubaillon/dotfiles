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

## Keyboard Layout

I like to, at least, change the behaviour of my CapsLock key. This is not always visible in
the dotfiles tracked here. Here is a small section of me trying to not forget.

### XKB

Xmodmap is considered old or not recommended by several posts/articles I found. Use setxkbmap
instead.

refs:
- archwiki - <https://wiki.archlinux.org/title/Xorg/Keyboard_configuration>
- XKB Configuration Guide - <https://www.x.org/releases/X11R7.5/doc/input/XKB-Config.html>

> The layout name is usually a 2-letter country code.
> To see a full list of keyboard models, layouts, variants and options, along with a short description,
> open `/usr/share/X11/xkb/rules/base.lst`
>
> Alternatively, you may use one of the following commands to see a list without a description:
> ```bash
> localectl list-x11-keymap-models
> localectl list-x11-keymap-layouts
> localectl list-x11-keymap-variants [layout]
> localectl list-x11-keymap-options
> ```
> ~ archwiki

Useful options for my setups
- **grp:alt_shift_toggle** to switch between layouts
- **caps:swapescape** to swap *CapsLock* and *Esc*
- **ctrl:nocaps** to replace *CapsLock* by *Ctrl*

My default mainstream layouts are **ie** and **fr**

#### setxkbmap - after login

My first successful attempt. Works by executing a `setxkbmap` at login (exec in i3/config)

Examples:
```bash
setxkbmap -layout ie,fr -option grp:alt_shift_toggle -option caps:swapescape
setxkbmap -layout ie -option ctrl:nocaps
```
Issues:
- fails when a new keyboard is plugged-in
- fails randomly (I did not try to figure out the root cause, maybe it is really random)

There was some workarounds, that could be summarized as *"when in doubt, re-run the command"*.

There was a moment I used the i3bar block that was showing the keyboard layout to re-run setxkbmap
as soon as an incorrect layout was detected. I am ashamed.

#### in Xorg config

This is just a way to make the setxkbmap default and permanent. Be cautious when modifying files.
I am not sure it would be fun to start without a working keyboard.

Separate options (or layouts) by commas.

Extract of`/etc/default/keyboard`

```
XKBLAYOUT="ie"
XKBVARIANT=""
XKBOPTIONS="ctrl:nocaps"
```

Extract of`/etc/X11/xorg.conf.d/00-keyboard.conf`

```
Option "XkbLayout" "ie"
Option "XkbOptions" "ctrl:nocaps"
```

### External Software - Kmonad

Alternatives that could be interesting: kanata, keyd

Still learning. See <.config/kmonad/README.md>

### Firmware - QMK

One day I'll get a fancy keyboard, with a fancy firmware

