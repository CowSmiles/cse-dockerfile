# 华为云CSE docker镜像构建
## for amd64:

```bash
docker build --build-arg VERSION=2.1.8 --build-arg PLATFORM=amd64 . -t cse:2.1.8
```

## for arm64
```bash
docker build --build-arg VERSION=2.1.8 --build-arg PLATFORM=arm64 . -t cse:2.1.8
```

部署参考docker-compose.yml
