NOFIND="-not -path '**/.git/*' -not -path '**/.hg/*
 -not -path '**/.svn/*' -not -path '**/*.egg/*'
 -not -path '.*\.min\.js'"

function pygrep() {
    find . -type f \
           '(' -regex '.*\.py' -or -regex '.*\.blm' ')'  \
       -not -path '**/.svn/*' \
       -not -path '**/.hg/*' \
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
        -not -path '.*\.min\.js' \
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

function bomb() {
    # Remove temporary files.
    find . -type f '(' -regex '.*~' \
                       -or -name '#*#' \
                       -or -name '.#*' ')' \
             -exec rm {} \; \
             -print

}

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
