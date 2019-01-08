#!/bin/sh

# © 2019 Konopnickiej.Com - Paweł 'felixd' Wojciechowski

# This tag will be used as default build env elmarit/harbour:build
REPO="elmarit/harbour"
TAG_DEFAULT_BUILD_ENV="build_ubuntu_latest"
TAG_DEFAULT_COMPILER="compiler_clang7"
TAG_LATEST="hb_34_latest"

BUILD_ENVS=()
COMPILERS=()
HARBOURS=()

for DIR in *; do
 if [ -d "${DIR}" ]; then
  case "$DIR" in
   build_*    ) BUILD_ENVS+=($DIR) ;;
   compiler_* ) COMPILERS+=($DIR)  ;;
   hb_*       ) HARBOURS+=($DIR)   ;;
  esac
 fi
done

echo "+-------------------------------------------------------------------+"
docker version
echo "+-------------------------------------------------------------------+"
echo " *** Building Dockerfiles of: $REPO *** "
echo "+-------------------------------------------------------------------+"
echo " *** Build Environments: ${BUILD_ENVS[@]}"
echo " *** Compilers: ${COMPILERS[@]}"
echo " *** Harbours: ${HARBOURS[@]}"
echo "+-------------------------------------------------------------------+"

# BUILD ENVIRONMENTS
for TAG in ${BUILD_ENVS[@]}; do
 docker build -t $REPO:$TAG $TAG/
done

docker tag $REPO:$TAG_DEFAULT_BUILD_ENV $REPO:build_base

# COMPILERS
for TAG in ${COMPILERS[@]}; do
 docker build -t $REPO:$TAG $TAG/
done

docker tag $REPO:$TAG_DEFAULT_COMPILER $REPO:compiler_default

# HARBOURS
for TAG in ${HARBOURS[@]}; do
 docker build -t $REPO:$TAG $TAG/
done

docker tag $REPO:$TAG_LATEST $REPO:latest

docker tag $REPO:hb_34_latest $REPO:3
docker tag $REPO:hb_34_latest $REPO:3.4
docker tag $REPO:hb_34_latest $REPO:3.4.0
docker tag $REPO:hb_34_latest $REPO:3.4.0dev

docker tag $REPO:hb_32_latest $REPO:3.2

# Pushing images to Docker HUB
docker push $REPO
