#!/usr/bin/env bash

set -ex

ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules

dd if=/dev/zero of=/EMPTY bs=1M || echo "dd exit code $? is suppressed";
rm -f /EMPTY;

sync;
