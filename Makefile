# My home directory

LIB_KEYCHAIN=/Library/Keychains/System.keychain
SYS_KEYCHAIN=/System/Library/Keychains/SystemRootCertificates.keychain

LOCAL_SSL_DIR=$(HOME)/.ssl
OSX_CERTS=$(LOCAL_SSL_DIR)/osx_cert.crt

$(LOCAL_SSL_DIR):
	mkdir -p $(LOCAL_SSL_DIR)

$(OSX_CERTS):
	security find-certificate -a -p $(LIB_KEYCHAIN) $(SYS_KEYCHAIN) \
		> $(OSX_CERTS)

.PHONY: certs
cert: $(OSX_CERTS)

.PHONY: rm-cert
rm-cert:
	rm $(OSX_CERTS)

.PHONY: re-cert
re-cert: rm-cert cert
