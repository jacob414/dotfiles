# dimman (Debian filserver) — read from skunkworks/hosts/dimman/dot-zsh.sh

if command -v zoxide >/dev/null 2>&1; then
	if [ -n "${ZSH_VERSION-}" ]; then
		eval "$(zoxide init zsh)"
	else
		eval "$(zoxide init bash)"
	fi
fi
