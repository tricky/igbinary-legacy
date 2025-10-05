#!/bin/bash -xeu

# Adjust Debian APT sources to use a different mirror if needed.
# This is useful in CI environments where the default mirror may be slow or unreliable.

. /etc/os-release

if [ "x${ID:-linux}" = "xdebian" -a "x${VERSION_CODENAME:-unknown}" = "xbuster" ] ; then
    echo "Adjusting APT sources for Debian Buster"
    sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until
fi
