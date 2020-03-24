# Dockerfile for EFB based alpine
# Copyright (C) 2018 mysteriouss
# Reference URL:
# 

FROM alpine:3.10

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
       py3-pip \
       py3-cairo \
       ' \
    && apk add --no-cache --virtual .build-deps \
       ${runDeps} \
    && mkdir -p /opt/ \
    && cd /opt/ \
    && pip3 install --upgrade pip \
    && pip3 install ehForwarderBot \
    && pip3 install efb-telegram-master \
    && pip3 install efb-wechat-slave

WORKDIR /opt

ENTRYPOINT ["ehforwarderbot"]
