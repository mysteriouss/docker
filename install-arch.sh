#!/bin/sh

yes | pacman -Sy docker docker-compose
systemctl start docker && systemctl enable docker

#run as root
