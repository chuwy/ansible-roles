###########
Deluge role
###########

Description
===========

Easily install, configure, and manage the deluge web user interface on ubuntu 12.04 with ansible! 
Only tested with ubuntu server 12.04.

Copied from: https://github.com/jgrowl/ansible-playbook-deluge

Installation
============

Edit vars/main.yml and change any variables if needed. The default variables should work fine.

Login to the webui: http://{server-ip}:8112

Default webui password: deluge

SSL Configuration
=================

In web-ui, click Preferences > Interface, then check 'Use SSL (paths relative to Deluge config folder)'. Fields should be pre-populated with a generated key and cert. If not you will need to generate one yourself. restart deluge-web service

Permissions
===========

Add any users you wish to be able to easily manage or access files downloaded through Deluge to the group deluge will run as, for example:

sudo adduser {username} deluge
