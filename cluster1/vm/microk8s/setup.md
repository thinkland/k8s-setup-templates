# setup VM

## 1. install linux VM
in this case we install Ubuntu, but Debian and other distributions should also work.

## 2. add users
```
adduser clusteradmin
adduser clusteradmin sudo
passwd  clusteradmin
```
The following steps should be executed as user "clusteradmin".

## 3. install and setup microk8s
```
sudo snap install microk8s --classic --channel=1.21

sudo usermod -a -G microk8s $USER
alias kubectl='microk8s kubectl'

# test simple deployment:
kubectl create deployment nginx --image=nginx
kubectl get pods
kubectl delete deployment.apps/nginx

# required addons:
microk8s enable dns
microk8s enable ingress
microk8s enable storage
microk8s enable rbac
microk8s enable metrics-server

# aquire kubectl config for remote access:
microk8s config > .kube/contabo-config.yaml
# on local computer:
scp clusteradmin@<contabo-server>:.kube/contabo-config.yaml <local-kube-dir>
# edit file and prefix all names with "contabo-" to separate them from other clusters
```