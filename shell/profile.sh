#!/bin/sh
. ~/src/mine/dotfiles/shell/baseenv.sh
. ~/src/mine/dotfiles/shell/functions.sh
HOSTFILE=`hostname | sed s/\.local/\.sh/`
. ~/src/mine/dotfiles/shell/$HOSTFILE
