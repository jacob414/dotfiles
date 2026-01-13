export EDITOR=qmacs
export PATH=$PATH:/Applications/calibre.app/Contents/MacOS/
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export GPG_TTY=$(tty)

if [ -n "${ZSH_VERSION-}" ]; then
	eval "$(zoxide init zsh)"
else
	eval "$(zoxide init bash)"
fi
