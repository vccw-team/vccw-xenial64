#!/usr/bin/env bash

set -ex

apt-get clean

rm -f /etc/ssh/ssh_host_*
cd /var/log
find /var/log/ -type f -name '*.log' -exec cp /dev/null {} \;
cp /dev/null /var/log/syslog

yes | cp /dev/null /root/.bash_history
yes | cp /dev/null /home/ubuntu/.bash_history

ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules

curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/ubuntu/.ssh/authorized_keys

chown -R ubuntu:ubuntu /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
chmod 600 /home/ubuntu/.ssh/authorized_keys

history -c
