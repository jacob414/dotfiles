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

if [ -n "${BASH_VERSION-}" ]; then
    export PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]\n\W \\% \[$(tput sgr0)\]'
fi

export SRC=$HOME/src
export MIRROR=$DB/Mirror

if [ -d ~/man ]; then
   MANPATH=~/man:"${MANPATH}"
   export MANPATH
fi

if [ "$(uname)" = "Darwin" ]; then
    export LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
fi

if [ -n "${BASH_VERSION-}" ]; then
    if test `id -nu` != 'jacob'; then
        export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
fi

export CLICOLOR=1

# macOS /bin/ls behavior note:
# When color output is enabled (via CLICOLOR/COLORTERM or -G), ls behaves like
# -F and does NOT follow symlinks given on the command line. This makes
# `ls ~/src/mine/icloud` print the symlink path instead of listing the iCloud
# Drive contents. Force -H so symlinked directories list their contents.
case "$-" in
    *i*)
        if [ "$(uname)" = "Darwin" ]; then
            unalias ls 2>/dev/null || true
            alias ls='/bin/ls -G -H'
        fi
        ;;
esac

# alias ll='ls -la'
# alias l='ls -1'
# alias prev='svn diff PREV'
# alias quickmacs='emacs -nw -q'
# alias nicepy='~/opt/mypy/bin/ipython'

alias oe-mode='source $OEBASE/scripts/oerc.sh'
alias oe-mongo='mongod run --config ~/lnk/oe/conf/mongod.conf'

if [ -n "${BASH_VERSION-}" ]; then
    case "$-" in
        *i*)
            command -v bind >/dev/null 2>&1 && bind '"\C-l":"ls\n"'
            export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo -e "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> $MINE/arkiv/shell.txt; fi'
            ;;
    esac
fi

export CDPATH=.:~/src:~:~/src/mine

# XDG Base Directories
export XDG_CONFIG_HOME="$(realpath ~/.config 2>/dev/null)"
export XDG_CACHE_HOME="$(realpath ~/.cache 2>/dev/null)"

export EDITOR=qmacs

# Custom prompt with red ROOT (bash interactive only)
if [ -n "${BASH_VERSION-}" ]; then
    if [ "$EUID" -eq 0 ]; then
        PS1='\''\[\033[01;31m\]ROOT\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]# '\'''
        case "$-" in
            *i*)
                echo '! ! ACHTUNG ! !' | figlet
                cat ~/src/mine/skunkworks/arkiv/blinkenlichten.txt
                ;;
        esac
    fi
fi
