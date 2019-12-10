
```bash
$ git clone 'https://github.com/mysteriouss/docker' 

$ cd docker/ss-libev_+_unbound-tls/alpine
$ docker build -t="55-server" .
$ docker run -itd --network=host -v $(pwd)/config:/config:rw 55-server

or simply run

$ cd docker/ss-libev_+_unbound-tls/alpine
$ sh start.sh

or

$ cd docker/ss-libev_+_unbound-tls/alpine
$ docker-compose up
```

