
```bash

#self-signed

openssl genrsa -out server.key 2048
openssl req -new -x509 -days 36500 -key server.key -out server.crt -subj "/C=CN/ST=SB/L=SB/O=SB/OU=SB/CN=SB"
openssl dhparam -out dhparams.pem 4096

#acme.sh

docker exec \ 
 -e Ali_Key= \
 -e Ali_Secret= \
 acme.sh --issue -d example.com -d *.example --dns dns_ali

docker  exec \
    -e DEPLOY_DOCKER_CONTAINER_LABEL=sh.acme.autoload.domain=example.com \
    -e DEPLOY_DOCKER_CONTAINER_KEY_FILE=/etc/nginx/certs/example.com/key.pem \
    -e DEPLOY_DOCKER_CONTAINER_CERT_FILE="/etc/nginx/certs/example.com/cert.pem" \
    -e DEPLOY_DOCKER_CONTAINER_CA_FILE="/etc/nginx/certs/example.com/ca.pem" \
    -e DEPLOY_DOCKER_CONTAINER_FULLCHAIN_FILE="/etc/nginx/certs/example.com/fullchain.pem" \
    -e DEPLOY_DOCKER_CONTAINER_RELOAD_CMD="service nginx force-reload" \
    acme.sh --deploy -d example.com --deploy-hook docker

```

