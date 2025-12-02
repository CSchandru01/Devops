#!/bin/bash
# ---------------
# CONFIG
#----------------
IMAGE_NAME="project1-app"
TAG="${1:-latest}"

echo "===================================="
echo "Building Docker image: $IMAGE_NAME:$TAG"
echo "===================================="

docker build -t ${IMAGE_NAME}:${TAG} .

echo "===================================="
echo "tagging Docker image:"
echo "===================================="
docker tag ${IMAGE_NAME}:${TAG} your-dockerhub-username/${IMAGE_NAME}:${TAG}

echo "===================================="
echo "login to Docker Registry:"
echo "===================================="
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

echo "===================================="
echo "Pushing Docker image to registry: ${IMAGE_NAME}:${TAG}"
echo "===================================="
docker push ${IMAGE_NAME}:${TAG}

echo "===================================="
echo "Docker image pushed successfully!"
echo "===================================="