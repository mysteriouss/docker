
```bash
$ git clone 'https://github.com/mysteriouss/docker' 

$ cd docker/ss-libev_+_unbound-tls/alpine/80
$ docker build -t="55-server" .
$ docker run -it --network=host 55-server

or simply run
$ cd docker/ss-libev_+_unbound-tls/alpine
$ sh 80.sh

or
$ cd docker/ss-libev_+_unbound-tls/alpine/80
$ docker-compose up
```

