#!/bin/sh

cd alpine/8989

docker build -t="55-server" .
docker run -itd -p 8989:8989/tcp -p 80:8989/udp 55-server

echo 'Server is now listening at port tcp:8989,udp:80'
echo
