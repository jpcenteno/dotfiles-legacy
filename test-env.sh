#! /usr/bin/env zsh

# ------------------------------------------------------------------------------
# Test Logging:
# ------------------------------------------------------------------------------

COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_RESET="\e[0m"

_log_success() {
    test_name="${1}"
    echo "${COLOR_GREEN}[ SUCCESS ]${COLOR_RESET} ${test_name}"
}

_log_failure() {
    test_name="${1}"
    echo "${COLOR_RED}[ FAILURE ]${COLOR_RESET} ${test_name}"
}

_test() {
    last_exit_status="${?}"
    test_name="${1}"

    if [ "${last_exit_status}" = "0" ]; then
        _log_success "${test_name}"
    else
        _log_failure "${test_name}"
    fi
}

# ------------------------------------------------------------------------------
# Test Zsh aliases:
# ------------------------------------------------------------------------------

# Gather the list of ZSH aliases available to the user.
zsh_aliases="$(zsh -c ". ${HOME}/.zshrc && alias")"

_test_zsh_alias() {
    alias_name="${1}"
    alias_target="${2}"

    test_name="${alias_name} is aliased to ${alias_target}!"

    [[ "${zsh_aliases}" =~ "${alias_name}=${alias_target}" ]]; _test "${test_name}"
}

# ------------------------------------------------------------------------------
# Development environment tests:
# ------------------------------------------------------------------------------

_test_zsh_alias 'g' 'git'
_test_zsh_alias 'ls' 'exa'
_test_zsh_alias 'foo' 'bar'
_test_zsh_alias 'vim' 'nvim'
_test_zsh_alias 'cat' 'bat'
