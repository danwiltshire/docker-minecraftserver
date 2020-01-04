# docker-minecraftserver

[![Build Status](https://travis-ci.com/danwiltshire/docker-minecraftserver.svg?branch=master)](https://travis-ci.com/danwiltshire/docker-minecraftserver)

Dockerised Minecraft server using Paper with optional configuration for Kubernetes.

The Paper server will start automatically and the default Minecraft port (25565/tcp) will be exposed.  A Persistent Volume is used for server and player data.

## Usage

### Docker
1. `docker-compose up -d` # Start container with detached console
2. `docker-compose ps` # Get list of containers
3. `docker attach [containerName]` # Console to container
*Ctrl P, then Ctrl Q to deattach*
4. `docker-compose logs`

### Kubernetes
You must have a Kubernetes-ready cluster to deploy to.

1. `kubectl apply -f paper-pv.yaml` # Creates a volume for PaperMC data
2. `kubectl apply -f paper-statefulset.yaml` # Creates 1 pod for PaperMC
3. `kubectl apply -f paper-service.yaml` # Creates a public IP mapping

Operational commands

- `kubectl get pods` # Get pods
- `kubectl attach -it [podName]` # Console to container
*Ctrl P, then Ctrl Q to deattach*

## Warnings
- Only tested in Docker and Google Kubernetes Engine (GKE).

## Acknowledgements
I'd like to thank the following GitHub users for allowing others to use their hard work.

- [ldilley](https://github.com/ldilley/minestat) for Minestat

