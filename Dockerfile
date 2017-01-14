FROM ubuntu:16.04
MAINTAINER "vccw-team"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install apt-utils -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y --no-install-recommends python-software-properties ansible ruby curl vim sudo rsyslog systemd systemd-cron sudo && \
    apt-get clean && \
    groupadd -g 1000 ubuntu && \
    useradd -g ubuntu -G sudo -m -s /bin/bash ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    su -l ubuntu -c bash -lc "curl https://raw.githubusercontent.com/vccw-team/vccw-xenial64/master/provision/playbook.yml > /home/ubuntu/middleware.yaml" && \
    echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts && \
    su -l ubuntu -c bash -lc "ansible-playbook /home/ubuntu/middleware.yaml" && \
    rm -rf /usr/share/doc && \
    rm -rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/man && \
    find /var/cache -type f -exec rm -rf {} \; && \
    apt-get -y autoremove && \
    apt-get -y clean

COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

USER ubuntu
