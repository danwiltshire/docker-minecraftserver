# docker-minecraftserver
Dockerised Minecraft server using Paper with optional configuration for Kubernetes.

The Paper server will start automatically and the default Minecraft port (25565/tcp) will be exposed.  A Persistent Volume is used for server and player data.

## Usage

### Docker
`docker-compose up`

### Kubernetes
**You must have a Kubernetes-ready cluster to deploy to.**

1. `kubectl apply -f ssd-storageclass.yaml`
2. `kubectl apply -f ssd-claim.yaml`
3. `kubectl apply -f paper-deployment.yaml`
4. `kubectl apply -f paper-service.yaml`

## Warnings
- Only tested in Docker and Google Kubernetes Engine (GKE).
