#!/bin/sh

_red() {
    printf '\033[1;31;31m%b\033[0m' "$1"
}

_os_full() {
    [ -f /etc/os-release ] && awk -F'[= "]' '/PRETTY_NAME/{print $3,$4,$5}' /etc/os-release && return
}

_error() {
    _red "[Error] "
    printf -- "%s" "$1"
    printf "\n"
    exit 1
}

_centos() {
    yum install -y yum-utils \
      device-mapper-persistent-data \
      lvm2

    yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo

    yum install -y epel-release docker-ce docker-compose

    systemctl start docker
    systemctl enable docker
}

_arch() {
    yes | pacman -Sy docker docker-compose
    systemctl start docker
    systemctl enable docker
}

_main() {
    case "$(_os_full)" in
        "Arch Linux ")
            _arch
            ;;
        "CentOS Linux 7")
            _centos
            ;;
        *)
            _error "Not supported OS"
            ;;
    esac
}

_main
