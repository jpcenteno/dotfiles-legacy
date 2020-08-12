#! /bin/sh
set -eu

# ----------------------------------------------------------------------------
# Logging functions:
# ----------------------------------------------------------------------------

## Print the title of the declaration.
dek_log_title() {
    declaration_title="${1}"
    printf "[%s]\n" "${declaration_title}"
}

dek_log_die() {
    echo "[die!] " "${*}"
    exit 1
}

# ----------------------------------------------------------------------------
# Tests:
# ----------------------------------------------------------------------------

dek_is_program_in_path() {
    command -v "${1}" 1>/dev/null;
}

# ----------------------------------------------------------------------------
# Detect distro:
# ----------------------------------------------------------------------------

## Return True if Mac OS is the host OS.
dek_distro_is_macos() {
    [ "$(uname)" = 'Darwin' ]
}

# ----------------------------------------------------------------------------
# Package Management
# ----------------------------------------------------------------------------

## Ensure a `Brew (1)` package is installed.
dek_package_brew_install() {
    dek_log_title "dek_package_brew_install ${*}"

    dek_distro_is_macos || dek_log_die "Operative System is not Mac OS!"
    dek_is_program_in_path "brew" || dek_log_die "brew (1) not in \$PATH!"

    brew install "${1}"
}

dek_package_brew_cask_install() {
    dek_log_title "dek_package_brew_cask_install ${*}"

    dek_distro_is_macos || dek_log_die "OS is not Mac OS!"
    dek_is_program_in_path "brew" || dek_log_die "brew (1) not in \$PATH!"

    brew cask install "${1}"
}

# ----------------------------------------------------------------------------
# FIXME: testing, remove this!
# ----------------------------------------------------------------------------

dek_package_brew_install "tmux"
