#!/bin/sh
#
# Pushes specified branch to specified remote after every N commit.
# Usage:
#
# This script needs to be called by a <repo>.git/hooks/post-commit
# script that supplies 3 parameters:
#  <remote name> <branch> <push ratio>
N=$((`git log $1/$2..HEAD --oneline | wc -l | xargs` % $3));
if [ "$N" == "0" ]; then
    git push $1 $2
fi
