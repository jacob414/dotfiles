#!/bin/sh
BREW=/usr/local
CELLAR=$BREW/Cellar

export EDITOR=qmacs

source ~/src/mine/dotfiles/shell/ext/git-completion.bash

# http://www.leancrew.com/all-this/2013/02/getting-rid-of-open-with-duplicates/
alias fixopenwith='"/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister" -kill -r -domain local -domain system -domain user'

# OPAM configuration
source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

function qv {
    qlmanage -p $1 2> /dev/null # spams stderr
}
