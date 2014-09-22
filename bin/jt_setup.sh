#!/bin/bash
#
# linux box setup

source gbash.sh || exit

GBASH_PASSTHROUGH_UNKNOWN_FLAGS=1
gbash::init_google "$@"
set -- "${GBASH_ARGV[@]}"

set -x

# setup 8 workspace: 4 x 2
gconftool-2 --type int --set /apps/compiz-1/general/screen0/options/hsize 4

# setup mouse move focus
gconftool-2 --type string --set /apps/metacity/general/focus_mode sloppy

# set ssh pubic key auth
# https://sites.google.com/a/google.com/goobuntu/sshd-configuration
sudo goobuntu-config set sshd_pubkeys "yes"
