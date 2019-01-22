#!/bin/sh

cd alpine/8989

docker build -t="55-server" .
docker run -itd --network=host 55-server

echo 'Server is now listening at port 8989'
echo
