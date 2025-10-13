# My home directory

.PHONY: homedirs
homedirs: ~/src/mine ~/.config ~/.ssh ~/bin ~/.local/bin ~/go ~/.gitconfig ~/.emacs.d ~/.gitignore ~/src/mine/skunkworks
# Collected check for directories under home

~/.ssl:
# SSL directory
	mkdir -p $~/.ssl

~/src/mine:
# (Somewhat) private source directories
	mkdir -p ~/src/mine

~/.config:
# Enshures a standard ~/.config tree exists
	mkdir -p ~/.config

~/bin:
# User-wide scripts & executables
	ln -s ~/src/mine/dotfiles/bin ~/bin

~/.local/bin:
# Some user-wide scripts & executables goes here
	mkdir -p ~/.local/bin

~/.ssh:
# Enshures a local ~/.ssh directory exists
	mkdir -p ~/.ssh

~/.emacs.d:
# Link in Emacs configs
	ln -s ~/src/mine/emacs.d ~/.emacs.d

~/src/mine/skunkworks:
# Creates the 'Skunkworks' directory
	mkdir -p ~/src/mine/skunkworks/arkiv
	touch ~/src/mine/skunkworks/arkiv/shell.txt

~/go:
# Keep go home under the ~/.config tree for a clearer home
	mkdir -p ~/.config/go
	ln -s ~/.config/go ~/go

~/.gitconfig:
# Keep Git configuration version controlled
	ln -s ~/.gitconfig src/mine/skunkworks/hosts/zipfly/git.conf

.PHONY: osx-certs
osx-cert: ~/.ssh/osx_cert.crt
# Fill in certificates

.PHONY: osx-rm-cert
osx-rm-cert:
# When rebuilding OSX certificates
	rm $(OSX_CERTS)

.PHONY: re-cert
osx-re-cert: osx-rm-cert osx-cert
# Certificates when running Apple junk

.PHONY: ~/.ssl/osx_cert.crt
~/.ssl/osx_cert.crt:
# Gather Apple certificates
	security find-certificate -a -p $(OSX_LIB_KEYCHAIN) $(OSX_SYS_KEYCHAIN) > $(OSX_CERTS)

.PHONY: osx
osx: osx-re-cert
# When running Apple junk
