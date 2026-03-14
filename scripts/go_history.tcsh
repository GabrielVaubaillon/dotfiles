#!/bin/tcsh -f

if ($# > 1) then
    echo .
    exit 1
endif
alias fzf "fzf --border --layout reverse --height 40% --no-sort"
if ($# == 0) then
    set dest = `tac $DIR_STACK_FILE | sed 's/^\(cd\|pushd\) //' | tail -n +2 | fzf`
else
    set dest = `tac $DIR_STACK_FILE | sed 's/^\(cd\|pushd\) //' | tail -n +2 | fzf --select-1 --query $1`
endif
if ($dest != "") then
    echo $dest
    exit 0
endif
echo .
exit 1
