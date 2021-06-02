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

# MyPy
export MYPYPATH=`realpath ~/src/ext/python/typeshed`:`realpath ~/src/mine/skunkworks/python/stubs`:`realpath ~/src/oss/kingston/`:`realpath ~/src/oss/ormsnack/`

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jacob/opt/plus/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jacob/opt/plus/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jacob/opt/plus/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jacob/opt/plus/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate plus

export XDG_RUNTIME_DIR="`realpath ~/.local/run`"

export PATH=$PATH:/Applications/kitty.app/Contents/MacOS
