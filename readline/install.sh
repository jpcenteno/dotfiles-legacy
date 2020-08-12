#! /bin/sh

# This script sets up my readline(3) config for the current user.

set -eu

. ./log.sh # Load logging lib

log_info "Setting up readline(3) config."

log_debug "Linking inputrc"
cp "${PWD}/inputrc" "${HOME}/.inputrc"

log_info "Finished setting up readline(3) config."
