# docker-papermc

[![Build Status](https://travis-ci.com/danwiltshire/docker-papermc.svg?branch=master)](https://travis-ci.com/danwiltshire/docker-papermc)

## Usage examples

1. Build the Docker image: `docker build --build-arg PAPERMC_VERSION=1.15.2 -t papermc:1.15.2 .`
2. Run the Docker image: `docker run -d -it -p 25565:25565 papermc:1.15.2`

## Acknowledgements
I'd like to thank the following GitHub users for allowing others to use their hard work.

- [ldilley](https://github.com/ldilley/minestat) for Minestat

