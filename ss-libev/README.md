
```bash

  p=YOUR_CUSTOM_PASSWORD && \

  yum update -y && yum install -y git && \
  git clone 'https://github.com/mysteriouss/docker.git' && \
  sh docker/install.sh && \
  cd docker/ss-libev/alpine && \
  sed 's/YOURPASSWORD/'$p'/g' -i config/55-server/config.json && \
  sed 's/YOURPASSWORD/'$p'/g' -i config/55-server-8989/config.json && \
  docker-compose up

```

