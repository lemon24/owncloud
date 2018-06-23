#!/bin/sh

# Need this because the openssl_certificate provided with Ansible 2.4 doesn't
# have the ownca provider.
#
# We rename the module due to https://github.com/ansible/ansible/issues/17078
#

URL=https://github.com/ansible/ansible/raw/devel/lib/ansible/modules/crypto/openssl_certificate.py

mkdir -p library
curl $URL -o library/openssl_certificate_latest.py -L
