# docker-subconverter
docker wrapper for [subconverter](https://github.com/tindy2013/subconverter/).

## Usage

first, run subconverter service in docker container:
```bash
docker run --name subconverter --restart always -d -p 25500:25500/tcp lckof/subconverter
```

then, use subscribe url in clash: 
```bash
http://localhost:25500/sub?target=clash&url=%YOUR_SUBSCRIBE_URL%
```

## Dev
### Use buildx

```bash
docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap
```

### Debug for single platform

```bash
docker buildx build --platform linux/amd64 -t subconverter --load .
docker run --name subconverter --rm -p 25500:25500/tcp subconverter
```

### Publish

```bash
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t lckof/subconverter:latest --push .
```

### Troubleshooting

If dns resolve failed, try [use host network mode](https://docs.docker.com/network/network-tutorial-host/).
```bash
docker run --name subconverter --restart always -d --network host lckof/subconverter
```
