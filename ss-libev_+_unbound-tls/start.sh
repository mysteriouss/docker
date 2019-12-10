#!/bin/sh

cd alpine

docker container ls | grep 55-server | awk '{printf $1}' | xargs docker stop
docker container prune -f
docker build -t="55-server" .
docker run -itd --network=host -v $(pwd)/config:/config:rw 55-server

echo 'Server is now listening at port 80 && reverse_proxy at 8989'
echo
