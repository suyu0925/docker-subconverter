# docker-subconverter
dockerfile for subconverter

## Usage

first, run subconverter service in docker container:
```bash
docker run --name subconverter --restart always -d -p 25500:25500/tcp lckof/subconverter
```

then, use subscribe url in clash: 
```bash
http://localhost:25500/sub?target=clash&url=%YOUR_SUBSCRIBE_URL%
```

## Debug for single platform

```bash
docker buildx build --platform linux/amd64 -t subconverter --load .
docker run --name subconverter --rm -p 25500:25500/tcp subconverter
```

## Publish

```bash
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t lckof/subconverter:latest --push .
```
