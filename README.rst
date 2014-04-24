######################################################
Basic Vagrant and Ansible configuration for Web Server
######################################################

Overview
========
Ansible expects Ubuntu 12.04 LTS.
This configuration includes:

#. etckeeper for tracing changes from the very begining
#. Very common stuff: git, vim, zsh
#. Docker
#. Creates a Boss User (should set variable ``boss_user`` somewhere inventory or site.yml)


Installation
============
It will execute everything as root, so keep the password access on this step.

On remote host
--------------
1. Set host in site.yml.
2. ``ansible-playbook site.yml  -k``. ``-k`` is for asking password. In this case you will be need sshpass program.

Or

1. Set host in site.yml.
2. On provisioned machine ``ssh-keygen -t rsa; mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_hosts;``
3. Back on provisioner machinve ``scp PROVISINED:.ssh/id_rsa .``
4. Add to ~/.ssh/config:

.. code-block:: 

  Host 192.168.1.135
      User chuwy
      Hostname 192.168.1.135
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/id_rsa

5. ``ansible-playbook site.yml``

With Vagrant
------------
``vagrant up``
