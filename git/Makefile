# Get location for this makefile
SRC_CONFIG_DIR = $(shell pwd)

# Git config should be located at:
TARGET_CONFIG_DIR = ~/.config/git

# Symlink this directory to ~/.config/git/
.PHONY: install
install:
	ln -f -s $(SRC_CONFIG_DIR) $(TARGET_CONFIG_DIR)
