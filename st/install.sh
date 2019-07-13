#! /bin/sh

set -eu

# --LOGGING-------------------------------------------------------------------
log() {
    action="$1"
    message="${2:-}"
    printf '%b[%b]%b %b\n' "\033[94m" "$action" "\033[0m" "$message"
}

apply_patch() {
    log 'Applying patch' "$1"
    patch -d st < "$1"
}
# ----------------------------------------------------------------------------

# Reset state of the st/ directory before applying the patches
log "Reseting state of st dir"
git submodule update --init st
git -C st checkout .
make -C st clean
rm -f st/config.h

# Apply 3rd party patches
log "Applying patch" "patches/st-anysize-0.8.1.diff"
patch -d st < patches/st-anysize-0.8.1.diff
log "Applying patch" "patches/st-scrollback-20190331-21367a0.diff"
patch -d st < patches/st-scrollback-20190331-21367a0.diff

# Custom configuration is applied to `config.h` instead of `config.def.h` to
# make it easier to generate patches.
log "Apply custom configuration"
make -C st config.h
patch -d st < patches/st-myconfig.diff

# Install
log "Installing system-wide"
sudo make -C st install
