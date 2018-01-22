#!/bin/sh
if [ -z "$DB" ]; then
    export DB=~/Dropbox
fi
if [ -z "$CONF" ]; then
    export CONF=$DB/Config/Shell
fi

DOTFILES=~/src/mine/dotfiles/shell
MINE=~/src/mine/skunkworks

export PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export SRC=$HOME/src
export MIRROR=$DB/Mirror

export PATH=$HOME/bin:$PATH

if [ -d ~/man ]; then
   MANPATH=~/man:"${MANPATH}"
   export MANPATH
fi

if test `id -nu` != 'jacob'; then
    export PS1='$\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo -e "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> $MINE/arkiv/shell.txt; fi'

export CDPATH=.:~/src:~:~/src/mine
