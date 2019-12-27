# docker-minecraftserver
Dockerised Minecraft server using Paper

## Project Stages
1. Deployable Docker container that auto runs the latest version of Paper
2. Testing with Travis CI
3. Automated container deployment somewhere...

## Project notes

### GCP Docker and Kubernetes app deployment
https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app

1. `git clone https://github.com/danwiltshire/docker-minecraftserver.git`
2. `export PROJECT_ID=eminent-century-263110`
3. `docker build -t gcr.io/${PROJECT_ID}/minecraftserver:v1 .`
4. `docker push gcr.io/${PROJECT_ID}/minecraftserver:v1`

## Next steps
1. Persistent volumes for MC world data
2. How to automate VM infrastructure for Docker/K8s - Terraform?
