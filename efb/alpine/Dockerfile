# Dockerfile for EFB based alpine
# Copyright (C) 2018 mysteriouss
# Reference URL:
# 

FROM alpine:latest

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates gcc musl-dev python3-dev libffi-dev openssl-dev

RUN set -ex \
    && runDeps=' \
       tar \
       git \
       wget \
       curl \
       ffmpeg \
       libmagic \
       python3 \
       py3-numpy \
       py3-pillow \
       ' \
    && apk add --no-cache --virtual .build-deps \
       ${runDeps} \
    && mkdir -p /opt/ \
    && cd /opt/ \
    && pip3 install --upgrade pip \
    && pip3 install git+https://github.com/blueset/ehForwarderBot.git \
    && pip3 install git+https://github.com/blueset/efb-telegram-master.git \
    && pip3 install git+https://github.com/blueset/efb-wechat-slave.git

WORKDIR /opt

ENTRYPOINT ["ehForwarderBot"]
