
```bash
[USAGE]

$ git clone 'https://github.com/mysteriouss/docker' 
$ cd docker/ss-libev_+_unbound-tls/alpine

$ docker build -t="55-server" .
$ docker run -it -p 80:80/tcp -p 80:80/udp 55-server
```

