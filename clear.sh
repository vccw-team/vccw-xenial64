#!/usr/bin/env bash

set -ex

apt-get clean
ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules
