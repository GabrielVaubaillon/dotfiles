#!/bin/tcsh -f

if ($# > 1) then
    echo .
    exit 1
endif
set cwd = `pwd`
if ($# == 0) then
    set dest = `parents.py $cwd | fzf --border --layout reverse --height 40%`
else
    set dest = `parents.py $cwd | fzf --filter $1 | head -n 1`
endif
if ($dest != "") then
    echo $dest
    exit 0
endif
echo .
exit 1
