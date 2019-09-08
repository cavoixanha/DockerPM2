# DockerPM2
PM2, Sharp Library on Docker

# Command Use
## Linux
docker exec f394f33ebe6e cat /etc/hosts
## Windows
docker exec [container-id or container-name] ipconfig
## Some install can use
```
# necessary for npm package sharp
RUN apk add --update --no-cache gcc g++ make libc6-compat
RUN apk add vips-dev fftw-dev build-base --no-cache \
        --repository https://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --repository https://dl-3.alpinelinux.org/alpine/edge/main
```
