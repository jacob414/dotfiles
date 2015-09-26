#!/bin/sh
source ~/src/mine/dotfiles/shell/ext/git-completion.bash

# From
# http://www.leancrew.com/all-this/2013/02/getting-rid-of-open-with-duplicates/
alias fixopenwith='"/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister" -kill -r -domain local -domain system -domain user'

function listening {
    lsof -n -i4TCP:$1 | grep LISTEN
}

function qv {
    qlmanage -p $1 2> /dev/null # spams stderr
}

export EDITOR="/usr/local/Cellar/emacs/24.5/bin/emacsclient"
