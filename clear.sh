#!/usr/bin/env bash

set -ex

sudo apt-get clean

sudo ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules

sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

history -c
