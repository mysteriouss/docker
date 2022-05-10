#!/bin/sh

yum install -y yum-utils \
      device-mapper-persistent-data \
      lvm2

yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo

yum install -y epel-release docker-ce

systemctl start docker && systemctl enable docker

curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

#run as root
