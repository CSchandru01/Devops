#!/bin/bash

set -e

NAMESPACE="project1-namespace"
DEPLOYMENT="project1-deployment"

echo "===================================="
echo "starting deployment to Kubernetes"
echo "namespace: $NAMESPACE"
echo "deployment: $DEPLOYMENT"
echo "===================================="

# check kubectl
if ! command -v kubectl &> /dev/null
then
    echo "Error: kubectl could not be found. Please install kubectl to proceed."
    exit 1
fi

echo"[1/7] creating namespace if not exists"
kubectl apply -f k8s/namespace.yaml

echo"[2/7] applying config maps"
kubectl apply -f k8s/configmap.yaml -n $NAMESPACE

echo"[3/7] applying secrets"
kubectl apply -f k8s/secret.yaml -n $NAMESPACE

echo"[4/7] applying deployment"
kubectl apply -f k8s/deployment.yaml -n $NAMESPACE

echo"[5/7] applying service"
kubectl apply -f k8s/service.yaml -n $NAMESPACE

echo "[6/7] applying ingress"
kubectl apply -f k8s/ingress.yaml -n $NAMESPACE

echo "[7/7] applying horizontal pod autoscaler"

echo "===================================="
echo "waiting for deployment to complete..."
echo "===================================="

kubectl rollout status deployment/$DEPLOYMENT -n $NAMESPACE

echo "===================================="
echo "deployment completed successfully!"
echo "checking service, pod status and ingress..."

kubectl get pods -n $NAMESPACE
kubectl get svc -n $NAMESPACE
kubectl get ingress -n $NAMESPACE

echo "===================================="
echo "deployment finished."
echo "===================================="
