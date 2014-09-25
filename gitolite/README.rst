###########################
Gitolite repository manager
###########################

You must put your admin.pub key into files directory.

After ansible completes it's work, add you git server to .ssh/config:

  Host gitolite-server
      HostName mygitoliteserver.com
      User git
      IdentityFile /path/to/admin.key   # private key of admin.pub; don't forget make it chmod 0600
      PreferredAuthentications publickey

Then you can clone your gitolite-admin: `git clone gitolite-server:gitolite-admin` and start to using it.

