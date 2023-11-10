# Dockerfile for xray based alpine
# Copyright (C) 2019 - 2023 mysteriouss
# Reference URL:
# https://github.com/XTLS/Xray-core
# https://github.com/Loyalsoldier/v2ray-rules-dat
# https://github.com/Loyalsoldier/geoip

FROM alpine:latest

WORKDIR /root
RUN set -ex \
        && apk add --no-cache tzdata ca-certificates \
        && mkdir -p /var/log/xray /usr/share/xray \
        && wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v1.8.0/Xray-linux-64.zip \
        && unzip /tmp/xray.zip && mv xray /usr/bin/ && chmod +x /usr/bin/xray \
        && wget -O /usr/share/xray/geosite.dat https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geosite.dat \
        && wget -O /usr/share/xray/geoip.dat https://raw.githubusercontent.com/Loyalsoldier/geoip/release/geoip.dat

VOLUME /etc/xray
ENV TZ=Asia/Shanghai
COPY config.json /etc/xray/config.json
CMD [ "/usr/bin/xray", "-config", "/etc/xray/config.json" ]
