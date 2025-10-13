# My home directory

OSX_LIB_KEYCHAIN=/Library/Keychains/System.keychain
OSX_SYS_KEYCHAIN=/System/Library/Keychains/SystemRootCertificates.keychain

LOCAL_SSL_DIR=$(HOME)/.ssl

OSX_CERTS=$(LOCAL_SSL_DIR)/osx_cert.crt

MY_SOURCES=~/src/mine

.PHONY: all
all: homedirs

$(LOCAL_SSL_DIR):
	mkdir -p $(LOCAL_SSL_DIR)

$(OSX_CERTS):
	security find-certificate -a -p $(OSX_LIB_KEYCHAIN) $(OSX_SYS_KEYCHAIN) \
		> $(OSX_CERTS)

.PHONY: certs
cert: $(OSX_CERTS)
# Fill in certificates

.PHONY: rm-cert
rm-cert:
	rm $(OSX_CERTS)

.PHONY: re-cert
re-cert: rm-cert cert

$(MY_SOURCES):
	mkdir -p $(MY_SOURCES)

~/.config:
# Enshures a standard ~/.config tree exists
	mkdir -p ~/.config

~/bin:
	ln -s ~/src/mine/dotfiles/bin ~/bin

~/.local/bin:
# Ensures a private bin path
	mkdir -p ~/.local/bin

~/.ssh:
# Enshures a local ~/.ssh directory exists
	mkdir -p ~/.ssh

~/src/mine/skunkworks:
# Creates the 'Skunkworks' directory
	mkdir -p ~/src/mine/skunkworks/arkiv
	touch ~/src/mine/skunkworks/arkiv/shell.txt

.PHONY: homedirs

homedirs: $(MY_SOURCES) ~/.config ~/.ssh ~/bin ~/.local/bin ~/src/mine/skunkworks
