#!/bin/tcsh -f

if ($# > 1) then
    pwd
    exit 1
endif
if ($# == 0) then
    set dest = `fzf < $DIR_BOOKMARKS`
else
    set dest = `fzf --select-1 --query $1 < $DIR_BOOKMARKS`
endif
if ($dest != "") then
    echo $dest
    exit 0
endif
pwd
exit 1
