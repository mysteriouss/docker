#!/bin/sh

cd alpine/80

docker container ls | grep 55-server | awk '{printf $1}' | xargs docker stop 
docker container prune -f
docker build -t="55-server" .
docker run -itd --network=host 55-server -v config:/config:rw -v service:/service:rw

echo 'Server is now listening at port 80'
echo
