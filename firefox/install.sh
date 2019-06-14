#! /bin/sh

## This script installs the `user.js` config file to a firefox profile.
##
## The profile is specified in the `PROFILE` env var. If `$PROFILE` is unset,
## the script will attempt to get the name of the default profile.

# Location of firefox config
FF_DIR="$HOME/.mozilla/firefox"

## Returns the name of the default profile
get_default_profile() {
    awk 'BEGIN{FS="="} /^Default/ {print $2}' "$FF_DIR/installs.ini"
}

# Name of the target firefox profile.
PROFILE="${PROFILE:-$(get_default_profile)}"

# Link destination for the user.js file
DST_PATH="$FF_DIR/$PROFILE/user.js"

# Full path to the original user.js file
SRC_PATH="$(realpath "$(dirname "$0")/user.js")"

ln -sf "$SRC_PATH" "$DST_PATH"
