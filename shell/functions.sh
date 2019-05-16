NOFIND="-not -path '**/.git/*' -not -path '**/.hg/*
 -not -path '**/.svn/*' -not -path '**/*.egg/*'
 -not -path '.*\.min\.js'"

function pygrep() {
    find . -type f \
           '(' -regex '.*\.py' -or -regex '.*\.blm' ')'  \
       -not -path '**/.svn/*' \
       -not -path '**/build/**' \
       -not -path '**/.hg/*' \
       -not -path '**/.git/*' \
       -not -path '**/lib/python*/site-packages/**' \
       -not -path '**/*.egg/*' \
           -not -path '*/test/test*.py' | \
        xargs grep -H -n -s "$*"
    return $?
}

function jsgrep() {
    find . -type f \
           '(' -regex '.*\.js' -or -regex '.*\.coffee' -or -regex '.*\.html' ')'  \
        -not -path '**/.svn/*' \
        -not -path '**/.hg/*' \
        -not -path '**/node_modules/*' \
        -not -path '.*\.min\.js' \
        -not -path '.*\.bundle\.js' \
        -not -path '*/test/test*.py' | \
        xargs grep -H -n -s "$*"
    return $?
}

function mgrep {
    find . -type f \
           '(' -regex '.*\.m' -or -regex '.*\.h' -or -regex '.*\.c' ')'  \
        $NOFIND | \
        xargs grep -H -n -s "$*"
    return $?
}

function textgrep {
    find . -type f \
         -not -path '**/.svn/*' \
         -not -path '**/.hg/*' \
         -not -path '**/*.egg/*' \
         -not -path '**/conf/ssh/*' \
         -not -path '**/conf/ipython/*' \
         -not -path '*.egg' \
         -not -path '*.cache' \
         -not -path '*.lock' \
         -not -path '*.jpg' \
         -not -path '*.pdf' \
         -not -path '*.png' \
         -not -path '*.gif' \
         -not -path '*.ico' \
         -not -path '*.pyc' \
         -not -path '*.gz' \
         -not -path '*.xml' \
         -not -path '**/*.egg-info/*' | \
        xargs grep -H -n -s "$*"
    return $?
}

alias lsxxx='textgrep XXX'
alias lstodo='textgrep TODO'
alias lswip='textgrep WIP'
alias lsfixme='textgrep FIXME'

function bomb() {
    # Remove temporary files.
    find . -type f '(' -regex '.*~' \
                       -or -name '#*#' \
                       -or -name '.#*' ')' \
             -exec rm {} \; \
             -print

}

alias pybomb='find . -name "*.pyc"  -exec rm '{}' \; -print'

function cdp { cd `px home $1`; }

function remoting {
    export EDITOR='emacs -nw'
}

alias eu-reset='hg revert --all && hg st | cut -c 3- | xargs rm && hg pull -u'

alias _bo-bomb='rm -rf bin/ develop-eggs/ eggs/ *.egg-info/ .installed.cfg parts/'
alias _bo-unbuild='rm -rf develop-eggs/ eggs/ *.egg-info/ .installed.cfg parts/'

alias skd='svn diff --diff-cmd=kdiff3'
alias duh='svn log -r COMMITTED'

alias isodate='date +%Y-%m-%d,%H.%M'
alias isodatetime='date +%Y-%m-%d,%H.%M'

alias hr='echo "--------------------------------------------------------------------------------"'

alias heremacs='echo "(make-frame-on-display \"$DISPLAY\")" | gnudoit'
alias droid-web-tail='./adb logcat browser:V *:S'

alias passphrase='shuf -n4 /usr/share/dict/words'

# Nifty oneliner to list all targets in a Makefile
# Thanks to todd hodes, see http://stackoverflow.com/a/9524878/288672
function lsmake {
    make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
}

# Cleans whiteboard images using ImageMagick
# Thanks to Leland Batey, see https://gist.github.com/lelandbatey/8677901
function wb-clean {
    convert "$1" -morphology Convolve DoG:15,100,0 \
        -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"
}

function em {
    emacs -nw -l ~/src/mine/emacs.d/micro.el -q $@
}

# To colour stderr in read, thx killdash9,
# https://serverfault.com/a/502019/51531
color()
 (set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1

# Prints current git branch if on repo - otherwise print nothing.
# Thanks  Eranga Bandara,
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
