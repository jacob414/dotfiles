#!/bin/sh
if [ -n `which gls` ]; then
    export PATH=/usr/local/bin:$PATH
fi

export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=~/.cabal/bin:$PATH

export EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"

export NODE_PATH=/usr/local/share/npm/lib/node_modules

export ANDROID_HOME=/usr/local/Cellar/android-sdk/r18

. /usr/local/Cellar/coreutils/8.7/aliases
unalias ls
alias ls='gls --color=auto'

alias smallrd='diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://200000`'

 # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

rvm use 1.9.3

source ~/src/mine/dotfiles/shell/ext/git-completion.bash
