
# Files

I want to keep these files safe for easy setup. But they should be copied / linked to somewhere else.

## 99-no-touchscreen.conf

path: /etc/X11/xorg.conf.d/99-no-touchscreen.conf
hardware: HP spectre 13

To disable the touchscreen.

## backlight.rules

path: /etc/udev/rules.d/backlight.rules
hardware: Framework13 (AMD graphics)

To allow backlight management by others than root. (needed acpibacklight also, xbacklight wasn't working)

