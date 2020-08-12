#! /usr/bin/env zsh

printf "\033c" # Clear screen

# ----------------------------------------------------------------------------
# Aux Functions:
# ----------------------------------------------------------------------------

__has_program() { command -v "${1}" 1>/dev/null; }
__not_in_path() { echo ":${PATH}:" | grep -qv ":${1}:" ; }
__exists_not_in_path() { [ -d "${1}" ] && __not_in_path "${1}" }
__path_prefix() { __exists_not_in_path "${1}" && export PATH="${1}:${PATH}"; }
__path_suffix() { __exists_not_in_path "${1}" && export PATH="${PATH}:${1}"; }

# ----------------------------------------------------------------------------
# Zsh Options:
# ----------------------------------------------------------------------------

setopt NO_CASE_GLOB # Case-insensitive globbing.

# ----------------------------------------------------------------------------
# Prompt completions:
# ----------------------------------------------------------------------------

# case insensitive path-completion. I can't understand it, but it works.
zstyle ':completion:*' matcher-list \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Enable partial completion
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

# ----------------------------------------------------------------------------
# Aliases:
# ----------------------------------------------------------------------------

alias g="git"

alias ydl="youtube-dl"
# Download with audio conversion:
alias ydl-mp3="youtube-dl --audio-quality 0 -x --audio-format mp3"
alias ydl-wav="youtube-dl --audio-quality 0 -x --audio-format wav"
alias ydl-flac="youtube-dl --audio-quality 0 -x --audio-format flac"

alias gcc='gcc-9'

alias prp="poetry run python"
alias sprp="sudo poetry run python"
alias prip="poetry run ipython"

# This function generates a disposable dir for experiments.
tmp() {
    TMPDIR="${TMPDIR:-/tmp}"
    cd "$( umask 077 && mktemp -d "${TMPDIR}/${1}.XXXX" )" || return
}

SHORTCUTS_FILE="${XDG_DATA_HOME}/shortcut/shortcuts.sh"
[ -f "${SHORTCUTS_FILE}" ] && . "${SHORTCUTS_FILE}"

# taskwarrior
alias t='task'
alias tin='task add +in'
alias tinc='task +in +PENDING count'

# Reload this config file
alias sorc="source ${ZDOTDIR}/.zshrc"

# ----------------------------------------------------------------------------
# Prompt:
# ----------------------------------------------------------------------------

__has_program "starship" && eval "$(starship init zsh)"

# ----------------------------------------------------------------------------
# Direnv:
# ----------------------------------------------------------------------------

__has_program "direnv" && eval "$(direnv hook zsh)"

# ----------------------------------------------------------------------------
# Syntax Highlighting
# ----------------------------------------------------------------------------
__source_if_exists() { [ -f "${0}" ] && source "${0}"; }
__source_if_exists "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
