# Dockerfile for shadowsocks-libev based alpine
# Copyright (C) 2018 mysteriouss
# Reference URL:
# https://github.com/shadowsocks/shadowsocks-libev
# https://github.com/teddysun/shadowsocks_install/tree/master/docker/shadowsocks-libev
# https://github.com/ajoergensen/docker-unbound

FROM alpine:3.12
LABEL maintainer="mysteriouss"

ENV LIBEV_VER 3.3.5
ENV LIBEV_NAME shadowsocks-libev-${LIBEV_VER}
ENV LIBEV_RELEASE https://github.com/shadowsocks/shadowsocks-libev/releases/download/v${LIBEV_VER}/${LIBEV_NAME}.tar.gz

RUN apk update && apk upgrade && \
    set -ex \
    && runDeps=' \
       tar \
       git \
       wget \
       build-base \
       c-ares-dev \
       autoconf \
       automake \
       libev-dev \
       libtool \
       libsodium-dev \
       linux-headers \
       mbedtls-dev \
       pcre-dev \
       ' \
    && apk add --no-cache --virtual .build-deps \
       ${runDeps} \
    && mkdir -p /tmp/libev \
    && cd /tmp/libev \
    && git clone --depth=1 https://github.com/shadowsocks/simple-obfs.git . \
    && git submodule update --init --recursive \
    && ./autogen.sh \
    && ./configure --prefix=/usr --disable-documentation \
    && make install \
    && rm -rf * \
    && wget -qO ${LIBEV_NAME}.tar.gz ${LIBEV_RELEASE} \
    && tar zxf ${LIBEV_NAME}.tar.gz \
    && cd ${LIBEV_NAME} \
    && ./configure --prefix=/usr --disable-documentation \
    && make install \
    && apk add --no-cache \
       rng-tools \
       $(scanelf --needed --nobanner /usr/bin/ss-* \
      | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
      | xargs -r apk info --installed \
      | sort -u) \
    && cd /tmp \
    && rm -rf /tmp/libev \
    && mv /usr/bin/ss-server /usr/bin/55-server \
    && mv /usr/bin/obfs-server /usr/bin/55-obfs \
    && mv /usr/bin/ss-local /usr/bin/55-local \
    && mv /usr/bin/ss-redir /usr/bin/55-redir \
    && mv /usr/bin/ss-tunnel /usr/bin/55-tun \
    && mv /usr/bin/ss-manager /usr/bin/55-manager \
    && mv /usr/bin/ss-nat /usr/bin/55-nat \
    && apk add --update --no-cache bind-tools unbound ca-certificates s6 \
    && update-ca-certificates 2>/dev/null || true \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

COPY files/root/ /
COPY config/ /config/


# fixups
RUN    chmod a+x /service/*/run

# ready to run
# EXPOSE 53/udp 53/tcp 80/udp 80/tcp

# manage with s6
ENTRYPOINT ["/bin/s6-svscan","/service"]
