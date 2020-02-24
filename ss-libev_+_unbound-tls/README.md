
```bash

  p=YOUR_CUSTOM_PASSWORD && \
  git clone 'https://github.com/mysteriouss/docker.git' && \
  cd docker && \
  sh install.sh && \
  cd ss-libev_+_unbound-tls/alpine && \
  sed 's/YOURPASSWORD/'$p'/g' -i config/55-server/config.json && \
  sed 's/YOURPASSWORD/'$p'/g' -i config/55-server-8989/config.json && \
  docker-compose up

```

