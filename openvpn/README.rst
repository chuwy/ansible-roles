#######
OpenVPN
#######

Quick installation
==================
Installing on digitalocean.com.

1. Create host (droplet) with SSH key
2. Add your host to ssh config
3. Add your host to ansible hosts
4. Create server config (see below)
5. Configure host and vars in playbook (see below)
6. Run `ansible-playbook myopenvpn.yml`


Configuration
=============
See ``defaults`` catalog for used variables;

Server config
-------------
You must generate all keys/certificates on client machine and point it in vars before running this role.
At least, you should have following files:

* ca.crt 
* burrow.crt
* burrow.cst
* burrow.key
* dh1024.pem

By default, all keys are places in bootstrap/easy-rsa/keys/.
By default, server called "burrow".
If you haven't these files, run bootstrap/start-rsa.sh script, it will generate everything you need. Then run this role again.

It will copy all certificates to the server on last step.

Client config
-------------
Also, you can generate client configuration.
Generate client certificates (``source vars && ./build-key CLIENT_NAME ``)
Then, set openvpn.client_name to your CLIENT_NAME and openvpn.generate_client_configuration var to 'yes'.
All necessary files will appear in $HOME/CLIENT_NAME.vpn.
