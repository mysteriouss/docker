# Dockerfile for EFB based alpine
# Copyright (C) 2018 mysteriouss
# Reference URL:
# 

FROM alpine:3.10

ENV LANG C.UTF-8

RUN set -ex \
    && runDeps=' \
       tar \
       git \
       wget \
       curl \
       gcc \
       musl-dev \
       python3-dev \
       libffi-dev \
       openssl-dev \
       ' \
    && apk add --update --no-cache --virtual .build-deps ${runDeps} \
    && apk add --update --no-cache \
       ca-certificates \
       python3 \
       py3-numpy \
       py3-pillow \
       py3-pip \
       py3-cairo \
       ffmpeg \
       libmagic \
    && pip3 install --upgrade pip \
    && pip3 install git+https://github.com/blueset/ehForwarderBot.git \
    && pip3 install git+https://github.com/blueset/efb-telegram-master.git \
    && pip3 install git+https://github.com/blueset/efb-wechat-slave.git \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* 

WORKDIR /opt

ENTRYPOINT ["ehforwarderbot"]
