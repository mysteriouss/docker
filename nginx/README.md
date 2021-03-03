
```bash

#self-signed

openssl genrsa -out server.key 2048

openssl req -new -x509 -days 36500 -key server.key -out server.crt -subj "/C=CN/ST=SB/L=SB/O=SB/OU=SB/CN=SB"

openssl dhparam -out dhparams.pem 4096


```

