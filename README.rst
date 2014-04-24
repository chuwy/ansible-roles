#########################
Ansble bootstraping roles
#########################

Overview
========
These roles mostly expects Ubuntu 12.04 LTS.

This configuration includes:

#. etckeeper for tracing changes from the very begining
#. Docker (for pre-14.04)
#. Creates a Boss User (should set variable ``boss_user`` somewhere inventory or site.yml)
#. OpenVPN tunnel
#. Gitolite
#. ...and something more

Usage
=====

#. Add target machine to ansible hosts file
#. Create playbook, with target machine, list of roles and configuration variables; see devbox.yml for example
#. Run ansible-playbook myplaybook.yml
