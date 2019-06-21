#! /bin/sh


# Arch linux
if [ -f /etc/arch-release ]; then

    sudo pacman -S dash

    # Create a pacman hook to prevent `bash` upgrades from overwriting the
    # `/bin/sh` symlink.
    # See: https://wiki.archlinux.org/index.php/Dash#Relinking_/bin/sh
    cat <<'EOF' | sudo tee /usr/share/libalpm/hooks/dash-relink.hook > /dev/null
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Target = bash

[Action]
Description = Re-pointing /bin/sh symlink to dash...
When = PostTransaction
Exec = /usr/bin/ln -sfT dash /usr/bin/sh
Depends = dash
EOF

fi


# Link sh to dash
sudo ln -sfT dash /usr/bin/sh
