#!/bin/bash

DEPLOYMENT_NAME=$1
IMAGE=$2

cat << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $DEPLOYMENT_NAME
  labels:
    app: my-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: $DEPLOYMENT_NAME
        image: $IMAGE
EOF
