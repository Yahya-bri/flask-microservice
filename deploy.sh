#!/bin/bash

export APP_NAME=your-app-name
export FLASK_ENV=development
export SERVICE_PORT=5000

kubectl delete deployment $APP_NAME
kubectl delete service $APP_NAME
kubectl delete ingress main-ingress

kubectl apply -f ./k8s/secrets.yml

envsubst < ./k8s/flask-deployment.yml.template > ./k8s/flask-deployment.yml
kubectl create -f ./k8s/flask-deployment.yml

envsubst < ./k8s/flask-service.yml.template > ./k8s/flask-service.yml
kubectl create -f ./k8s/flask-service.yml

envsubst < ./k8s/ingress.yml.template > ./k8s/ingress.yml
kubectl create -f ./k8s/ingress.yml

echo "--------------------------------------------------------------------------------"
sleep 2
kubectl get all
echo "--------------------------------------------------------------------------------"
kubectl get ingress

echo "$(minikube ip) hello.world" | sudo tee -a /etc/hosts