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
3. `gcloud config set project $PROJECT_ID`
4. `docker build -t gcr.io/${PROJECT_ID}/minecraftserver:v1 .`
5. `docker push gcr.io/${PROJECT_ID}/minecraftserver:v1`
6. `gcloud config set compute/zone europe-west2-b`
7. `gcloud container clusters create minecraftserver-cluster --num-nodes=2`
8. `kubectl create deployment minecraftserver-dpmt --image=gcr.io/${PROJECT_ID}/minecraftserver:v1`
9. `kubectl expose deployment minecraftserver-dpmt --type=LoadBalancer --port 25565 --target-port 25565`
10. `kubectl scale deployment minecraftserver-dpmt --replicas=3`

#### Verification
- `kubectl get service`
- `kubectl get deployment minecraftserver-dpmt`
- `kubectl get pods`

#### Misc commands
- Specify what cluster to run kubectl against: `gcloud container clusters get-credentials my-cluster`
- Running individual kubectl commands against a specific cluster using `--cluster my-cluster`

## Next steps
1. Persistent volumes for MC world data
- The volume now mounts under /mnt/data
- Next; run MC from the dir.  Permissions and dedicated minecraft user?
2. Cleanup of README usage
3. Performance settings/CPU/mem, etc
4. How to automate VM infrastructure for Docker/K8s - Terraform?
- Scaffold? is this GCP only?
