#!/bin/sh

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

cd /usr/local/src
git clone 'https://github.com/mysteriouss/docker'
cd docker/ss-libev_+_unbound-tls/alpine/8989

docker build -t="55-server" .
docker run -itd --network=host 55-server

echo 'Server is now listening at port 8989'
echo

