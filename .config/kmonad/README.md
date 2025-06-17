https://github.com/kmonad/kmonad/blob/master/keymap/tutorial.kbd
https://wayfaringsouls.com/blog/kmonad-to-remap-keyboard-layout

## builtin

builtin_kb_layout.kbd is for the builtin laptop keyboard.
I want it to run as soon as possible, so it starts with systemd
kmonad.service
    must be put in /etc/systemd/system/ as root
    sudo systemctl enable --now kmonad.service

## logitech external keyboard

This one only launch when the keyboard gets connected
TODO:
- [ ] udev
- [ ] desactivate when disconnected?
