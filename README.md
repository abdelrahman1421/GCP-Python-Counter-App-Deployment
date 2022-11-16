# GCP_FInal_Project

The project is to Deploy a simple python application on GKE cluster, The image used in deployment is builed and pushed to
GCR and GKE use it to pull images.
# Projetc Overview And Architecture
![GCP horizontal framework](https://user-images.githubusercontent.com/73159522/202285588-7aefb042-b6ae-4661-8ef0-6b25666c7880.jpeg)

## 🛠 Tools :
| Tool | Purpose |
| ------ | ------ |
| [ Terraform ](https://www.terraform.io) | Terraform is an open-source infrastructure as a code software. |
| [ Google Kubernetes Engine (GKE) ](https://cloud.google.com/kubernetes-engine) | Google Kubernetes Engine (GKE) is a managed, production-ready environment for running containerized applications. |
| [ Google Container Registery (GCR) ](https://cloud.google.com/container-registry) | Store, manage, and secure your Docker container images. |
| [ Docker ](https://www.docker.com) | Docker is a software tool used to deliver software in containers.|
| [ Gcloud ](https://cloud.google.com/sdk/gcloud) | The Google Cloud CLI is a set of tools to create and manage Google Cloud resources. You can use these tools to perform many common platform tasks from the command line or through scripts and other automation. |


## Configure Infrastructure Using Terraform :
Four modules were designed to provide a stable Infrastructure to the project
- ###  Network Module Contains The Following Resources :
  - VPC that project will be assigned to
  - Two subnets one for GKE and another for Bastion Host
  - NAT Gateway and Router
  - Firewall to allow SSH Connection

- ###  Service Account Module Contains The Following Resources :
  - Service Account For GKE
  - Service Account For VM

- ###  GKE Module Contains The Following Resources :
  - Private GKE
  - Container Node Pool


- ###  VM  Module Contains The Following Resources :
  - VM Pastion 

## First Step: Create Infrastructure :
### 1. Clone The Repo:
```
git clone https://github.com/abdelrahman1421/GCP_FInal_Project.git

```

### 2. Change Directory TO Infrastructure :
```
cd GCP_FInal_Project/Infrastructure

```
### 3. Initialize provider Plugins :
```
terraform init

```

### 4. Check Terraform Plan :
```
terraform plan -var-file prod.tfvars

```
### 5. Apply Infrastructure :
```
terraform apply -var-file prod.tfvars

```
![Screenshot from 2022-11-16 21-15-59](https://user-images.githubusercontent.com/73159522/202287022-34b79321-59c0-45d9-9ffc-86d028ba6cbb.png)

## Second Step: Connect To GKE Usnig Pastion VM :
> Now after the Infrastructure is built navigate to `Compute Engine` from the GCP console then `VM instances` and click the SSH to `private-vm` to configure to to work with GKE cluster by running the following commands:

### 1. Install Git
```
sudo apt-get install git
```

### 2. Install Kubectl
```
sudo apt-get install kubectl
```
### 3. Install GKE gcloud auth Plugin
```
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
```
### 4. Install Docker
```
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker
sudo usermod -aG docker ${USER}
```

### 4. Connect to GKE Cluster
> Go to the `Kubernetes Engine` Page in your `Clusters` tab you will find the `private-cluster`
```
gcloud container clusters get-credentials project-cluster --zone us-central1-a --project abde-367812
```
![Screenshot from 2022-11-16 21-58-52](https://user-images.githubusercontent.com/73159522/202288111-a2fe5251-2949-4d0b-a445-9467d1ecfa4c.png)


### 5. Build Image Using Docker Engine
> - First change the directory to where the `Dockerfile` located
> - Authenticate your docker credentials with gcloud GCR
> - Then  login to docker using your `username` and `password`
> - Build your images
> - Push your image to your GCR
```
cd GCP_FInal_Project/App
docker login
gcloud auth configure-docker
docker build . -t gcr.io/`Your Project ID`/`Image Name:Tag`
docker push gcr.io/`Your Project ID`/`Image Name:Tag`
```
![Screenshot from 2022-11-16 21-58-38](https://user-images.githubusercontent.com/73159522/202289368-e41d4566-aff5-4446-908a-ab26107cf1f3.png)

![Screenshot from 2022-11-16 22-01-46](https://user-images.githubusercontent.com/73159522/202289423-2ddfef7f-3f0f-4493-9ba6-da64f35e9ef2.png)

![Screenshot from 2022-11-16 22-06-53](https://user-images.githubusercontent.com/73159522/202289451-0d71bbf4-d959-4d5c-9a9a-825af81b4370.png)

## Third Step: App Deployment 
### 1. Change Image In `app_deployment.yaml`
> - Change cirectory to `App`
> - Then Edit `app_deployment.yaml` you will find image at line `20`
```
cd GCP_FInal_Project/Deployment
vi app_deployment.yaml
```
> - Change image to your image with right tag
### 3. Apply Deployments To GKE

```
kubectl apply -f redis_deployment.yaml
kubectl apply -f redis_svc.yaml
kubectl apply -f app_deployment.yaml
kubectl apply -f app_loadbalancer_svc.yaml
```
![Screenshot from 2022-11-16 22-11-15](https://user-images.githubusercontent.com/73159522/202291085-743b121e-30ea-48ac-83bd-df2f6c2fabd5.png)

![Screenshot from 2022-11-16 22-09-41](https://user-images.githubusercontent.com/73159522/202291006-bd5edb9b-de2f-4c15-8f6d-76fa1817c4d2.png)

### 3. Get Your App Url
```
kubectl get svc
```
> - Copy `load-balancer` IP followed by Port
> - Paste it in browser and chek app


## Final Result
![Screenshot from 2022-11-16 22-10-34](https://user-images.githubusercontent.com/73159522/202291691-e4aab69c-2b88-41f1-88bf-8329004487e7.png)

## Clean Up Project
```
cd GCP_FInal_Project/Infrastructure
terraform destroy -var-file prod.tfvars
```
