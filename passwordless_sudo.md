# Passwordless Sudo

Run `sudo visudo -f /etc/sudoers.d/00-webdev-nopasswd` and paste the line below in to enable passwordless sudo for the webdev user.

`webdev ALL=(ALL) NOPASSWD:ALL`
