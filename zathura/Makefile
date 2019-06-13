#----------------------------------------------------------------------------
# Config:
#----------------------------------------------------------------------------

# Default XDG_CONFIG_HOME if the ENV var is unset.
XDG_CONFIG_HOME ?= ~/.config

# Get this makefile's location.
SRC_DIR = $(shell pwd)

# Location where the program will look it up.
TARGET_CONFIG_DIR = $(XDG_CONFIG_HOME)/zathura

#----------------------------------------------------------------------------
# Targets
#----------------------------------------------------------------------------

.PHONY: install
install:
	# Symlink the config directory (where the program looks it up) to the src
	# config dir on this repo where I version-control it.
	ln -f -s $(SRC_CONFIG_DIR) $(TARGET_CONFIG_DIR)
