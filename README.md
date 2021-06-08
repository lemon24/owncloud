Tools to set up an nginx server with mutual TLS authentication.

Should work with Ubuntu 16.04 (managed node) and Ansible 2.9+ (control machine).

Mostly inspired by

* https://blog.codeship.com/how-to-set-up-mutual-tls-authentication/ (original)
* https://www.phildev.net/ssl/creating_ca.html
* https://gquintana.github.io/2020/11/28/Build-your-own-CA-with-Ansible.html
* https://blog.pinterjann.is/ed25519-certificates.html
* https://www.golinuxcloud.com/openssl-generate-ecc-certificate/
* https://security.stackexchange.com/questions/236931/whats-the-deal-with-x25519-support-in-chrome-firefox
 

## Usage

### Initial setup

Create certificate authority certificate:

    ansible-playbook ca.yaml

### Set up a server

Add server details to `inventory.ini`.

Set server up:

    ansible-playbook server.yaml -i inventory.ini

This will:

* generate the server certificate
* set up nginx (with mutual authentication)
* mount /dev/xvdb on /data

### Create client certificate

Add users as needed in `client.yaml`.

Create client certificates:

    ansible-playbook client.yaml

A PKCS #12 file will be generated for each user in `out/client/$user.p12`.

