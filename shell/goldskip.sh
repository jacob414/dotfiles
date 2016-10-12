#!/bin/sh
if [ -n `which gls` ]; then
    export PATH=/usr/local/bin:$PATH
fi

BREW=/usr/local
CELLAR=$BREW/Cellar

export PATH=$CELLAR/python/2.7.10_2/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export EDITOR=emacsclient

export NODE_PATH=/usr/local/share/npm/lib/node_modules

unalias ls
alias ls='gls --color=auto'

alias smallrd='diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://200000`'

 # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

rvm use 2.0.0

source ~/src/mine/dotfiles/shell/ext/git-completion.bash

# From
# http://www.leancrew.com/all-this/2013/02/getting-rid-of-open-with-duplicates/
alias fixopenwith='"/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister" -kill -r -domain local -domain system -domain user'

# https://github.com/basecamp/pow/issues/412
alias powfix='touch ~/.pow/restart.txt'

function listening {
    lsof -n -i4TCP:$1 | grep LISTEN
}

# OPAM configuration
source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

function qv {
    qlmanage -p $1 2> /dev/null # spams stderr
}

# NVM configuration
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use system

alias dns-flush='sudo killall -HUP mDNSResponder'

# Ansible
export ANSIBLE_HOSTS=$HOME/src/plexical/infrastructure/ansible.ini
