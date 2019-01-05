#!/bin/bash

# (c) 2019 Paweł 'felixd' Wojciechowski

# This tag will be used as default build env elmarit/harbour:build
DEFAULT_BUILD_ENV_TAG="build_clang7"
REPO="elmarit/harbour"

echo " *** Building Dockerfiles of: $REPO *** "

for TAG in *; do
    if [ -d "${TAG}" ]; then
        echo "  *** Building $REPO:${TAG} *** "
        docker build -t $REPO:${TAG} ${TAG}/
    fi
done

# Setting default build environment
docker tag $REPO:$DEFAULT_BUILD_ENV_TAG $REPO:build

# Pushing to Docker HUB
docker push $REPO
