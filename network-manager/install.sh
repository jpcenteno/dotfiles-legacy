#! /bin/sh

if [ -f /etc/arch-release ]; then

    # Install NM if not present
    if ! pacman -Q networkmanager; then
        sudo pacman -S networkmanager
    fi

    # Enable and start
    sudo systemctl enable NetworkManager.service
    sudo systemctl start NetworkManager.service

fi
