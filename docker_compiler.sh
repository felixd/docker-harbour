#!/bin/bash
# © 2019 Konopnickiej.Com - Paweł 'felixd' Wojciechowski

REPO="elmarit/harbour"
TAG_DEFAULT_COMPILER="compiler_clang7"

COMPILERS=()

for DIR in *; do
 if [ -d "${DIR}" ]; then
  case "$DIR" in
   compiler_* ) COMPILERS+=($DIR)  ;;
  esac
 fi
done

echo "+-------------------------------------------------------------------+"
docker version
echo "+-------------------------------------------------------------------+"
echo " *** Building Compiler images for Harbour Project *** "
echo "+-------------------------------------------------------------------+"
echo " *** Compilers: ${COMPILERS[@]}"
echo "+-------------------------------------------------------------------+"

# COMPILERS
for TAG in ${COMPILERS[@]}; do
 echo "+-------------------------------------------------------------------+"
 echo " *** Building TAG: :$TAG *** "
 echo "+-------------------------------------------------------------------+"
 docker pull $REPO:$TAG || true # In case image does not exist
 docker build --cache-from $REPO:$TAG  --pull -t $REPO:$TAG $TAG/
done

docker tag $REPO:$TAG_DEFAULT_COMPILER $REPO:compiler
docker tag $REPO:$TAG_DEFAULT_COMPILER $REPO:compiler_default
