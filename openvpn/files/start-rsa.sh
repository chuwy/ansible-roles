#!/bin/bash

# Only .key files need to be kept secret, .crt and .csr files can be sent over
# insecure channels such as plaintext email. But ca.key and ca.crt are required
# for creating new certificates.

if [ -z "$1" ]; then
    OPENVPN_SERVER_NAME='burrow'
    echo "default server name is $OPENVPN_SERVER_NAME, you can specify it by first arg"
else
    OPENVPN_SERVER_NAME="$1"
fi

if [ -d "easy-rsa" ]; then
    echo 'easy-rsa direcotry already exists, be careful'
    cd easy-rsa
else
    mkdir easy-rsa && cd easy-rsa
fi

if [ -d "keys" ]; then
    echo 'keys direcory already exists'
    exit 1
fi

sudo apt-get install openvpn

if [ "$(lsb_release -c -s)" == "precise" ] || [ "$(lsb_release -c -s)" == "wheezy" ]; then
    cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0/* .
elif [ "$(lsb_release -c -s)" == "trusty" ]; then
    sudo apt-get install easy-rsa
    cp -r /usr/share/easy-rsa/* .
else
    echo "you've choosed wrong distro :("
fi

vim vars
source vars
# Appears almost empty keys catalog
./clean-all
# ca.crt & ca.key appears in keys catalog
./build-ca
# myserver.crt myserver.cst myserver.key appears in keys; other files changing
./build-key-server $OPENVPN_SERVER_NAME
# dh1024.pem appears in keys
./build-dh

# At the end, for working server, we need following files:
# * ca.crt 
# * ca.key (actually, work without it)
# * myserver.crt
# * myserver.cst
# * myserver.key
# * dh1024.pem
