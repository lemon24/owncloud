Tools to set up an nginx server with mutual TLS authentication.

Should work with Ubuntu 16.04 (managed node) and Ansible 2.4+ (control machine).

Mostly inspired by https://blog.codeship.com/how-to-set-up-mutual-tls-authentication/

## Usage

### Initial setup

Get the latest openssl_certificate module:

    ./get_latest_openssl_certificate.sh

Create certificate authority certificate:

    ansible-playbook ca.yaml

### Set up a server

Add server details to `inventory.ini`.

Set server up:

    ansible-playbook server.yaml -i inventory.ini

This will:

* generate the server certificate
* TODO: set up nginx

### Create client certificate

Add users as needed in `client.yaml`.

Create client certificates:

    ansible-playbook client.yaml

A PKCS #12 file will be generated for each user in `out/client/$user.p12`.

