#!/bin/sh
( cd ~/src/mine/dotfiles && out="$(make 2>&1)"; s=$?; [ $s -eq 0 ] || printf '%s\n' "$out" >&2; exit $s )

export PATH=$PATH:$HOME/src/mine/dotfiles/bin:$HOME/bin

DOTFILES=~/src/mine/dotfiles
MINE=~/src/mine/skunkworks

which realpath > /dev/null 2>&1
if [ "$?" != "0" ]; then
    echo "realpath not present"
    mkdir -p ~/bin
    cp "$DOTFILES/env/osx/realpath" ~/bin/realpath
fi

source "${DOTFILES}/shell/functions.sh"

export PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]\n\W \\$ \[$(tput sgr0)\]'

export SRC=$HOME/src
export MIRROR=$DB/Mirror

if [ -d ~/man ]; then
   MANPATH=~/man:"${MANPATH}"
   export MANPATH
fi

if [ `uname` == "Darwin" ]; then
    export LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
fi

if test `id -nu` != 'jacob'; then
    export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

if test `uname` == 'Darwin'; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -la'
alias l='ls -1'
alias prev='svn diff PREV'
alias quickmacs='emacs -nw -q'
alias nicepy='~/opt/mypy/bin/ipython'

alias oe-mode='source $OEBASE/scripts/oerc.sh'
alias oe-mongo='mongod run --config ~/lnk/oe/conf/mongod.conf'

bind '"\C-l":"ls\n"'

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo -e "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> $MINE/arkiv/shell.txt; fi'

export CDPATH=.:~/src:~:~/src/mine

# XDG Base Directories
export XDG_CONFIG_HOME="$(realpath ~/.config 2>/dev/null)"
export XDG_CACHE_HOME="$(realpath ~/.cache 2>/dev/null)"

export EDITOR=qmacs
