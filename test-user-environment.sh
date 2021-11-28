#! /bin/sh
set -eu

ZSHRC_PATH="${HOME}/.zshrc"

# ------------------------------------------------------------------------------
# Test functions
# ------------------------------------------------------------------------------

ALIASES="$( zsh -c ". ${ZSHRC_PATH} && alias" )"
ENV_VARS="$( zsh -c ". ${ZSHRC_PATH} && env" )"

assert_alias_equals() {
    key="${1}"
    val="${2}"

    echo "${ALIASES}" | grep "${key}=${val}"
}

assert_env_var_equals() {
    key="${1}"
    val="${2}"

    if ! echo "${ENV_VARS}" | grep "${key}=${val}"; then
        echo "[assert_env_var_equals] ${key} not aliased to ${val}"
        exit 1
    fi
}

# ------------------------------------------------------------------------------
# Assertions about Zsh dev environment
# ------------------------------------------------------------------------------

assert_alias_equals "foo" "bar"
