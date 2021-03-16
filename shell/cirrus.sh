#!/bin/sh
export EDITOR=qmacs

source ~/src/mine/dotfiles/shell/ext/git-completion.bash

# OPAM configuration
source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# MyPy
export MYPYPATH=`realpath ~/src/ext/python/typeshed`:`realpath ~/src/mine/skunkworks/python/stubs`
