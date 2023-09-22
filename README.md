# docker-subconverter
dockerfile for subconverter

## Usage

```bash
docker run --name subconverter --restart always -d -p 25500:25500/tcp lckof/subconverter
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
