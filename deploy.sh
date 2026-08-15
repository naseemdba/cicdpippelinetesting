#!/bin/bash
set -e

IMAGE_URI=$1

echo "Pulling image: $IMAGE_URI"
docker pull $IMAGE_URI

echo "Stopping old container..."
docker stop flask-app || true
docker rm flask-app || true

echo "Running new container..."
docker run -d --name flask-app -p 5000:5000 $IMAGE_URI

echo "Checking health of this appliction..."
sleep 5
curl -f http://localhost:5000/health
