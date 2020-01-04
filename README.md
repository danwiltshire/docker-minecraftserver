# docker-minecraftserver

[![Build Status](https://travis-ci.com/danwiltshire/docker-minecraftserver.svg?branch=master)](https://travis-ci.com/danwiltshire/docker-minecraftserver)

Dockerised Minecraft server using Paper with optional configuration for Kubernetes.

The Paper server will start automatically and the default Minecraft port (25565/tcp) will be exposed.  A Persistent Volume is used for server and player data.

## Usage

### Docker
`docker-compose up -d` # Start container with detached console
`docker-compose ps` # Get containers
`docker attach [container]` # Console to container
`docker-compose logs`

### Kubernetes
You must have a Kubernetes-ready cluster to deploy to.

1. `kubectl apply -f ssd-storageclass.yaml` # GKE only
2. `kubectl apply -f ssd-claim.yaml` # GKE only
3. `kubectl apply -f paper-deployment.yaml`
4. `kubectl apply -f paper-service.yaml`

Operational commands

- `kubectl get pods` # Get pods
- `kubectl attach -it [podName]` # Console to container

## Warnings
- Only tested in Docker and Google Kubernetes Engine (GKE).

## Acknowledgements
I'd like to thank the following GitHub users for allowing others to use their hard work.

- [ldilley](https://github.com/ldilley/minestat) for Minestat

