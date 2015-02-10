#!/bin/sh
if [ -z "$DB" ]; then
    export DB=~/Dropbox
fi
if [ -z "$CONF" ]; then
    export CONF=$DB/Config/Shell
fi

DOTFILES=~/src/mine/dotfiles/shell

export PS1="\[\033[0;32m\]\h\[\033[0m\] \w$ "
export SRC=$HOME/src
export MIRROR=$DB/Mirror

export PATH=$HOME/bin:$PATH

if [ -d ~/man ]; then
   MANPATH=~/man:"${MANPATH}"
   export MANPATH
fi

if test `id -nu` != 'jacob'; then
    export PS1="\[\033[0;31m\]\u\[\033[0;32m\]@\h\[\033[0m\] \w$ "
fi

if test `uname` == 'Darwin'; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -la'
alias prev='svn diff PREV'
alias quickmacs='emacs -nw -q'
alias nicepy='~/opt/mypy/bin/ipython'

export OEBASE=$DB/Jobb/OE
alias oe-mode='source $OEBASE/scripts/oerc.sh'
alias oe-mongo='mongod run --config ~/lnk/oe/conf/mongod.conf'

bind '"\C-l":"ls\n"'
