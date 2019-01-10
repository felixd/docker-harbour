#!/bin/bash
# © 2019 Konopnickiej.Com - Paweł 'felixd' Wojciechowski

REPO="elmarit/harbour"
TAG_LATEST="hb_34_latest"

HARBOURS=()

for DIR in *; do
 if [ -d "${DIR}" ]; then
  case "$DIR" in
   hb_*       ) HARBOURS+=($DIR)   ;;
  esac
 fi
done

echo "+-------------------------------------------------------------------+"
docker version
echo "+-------------------------------------------------------------------+"
echo " *** Building Harbour Projects *** "
echo "+-------------------------------------------------------------------+"
echo " *** Harbours: ${HARBOURS[@]}"
echo "+-------------------------------------------------------------------+"

# HARBOURS
# Those Dockerfiles have to be rebuilt everytime. We do not know if remote Git repo has changed or not.
for TAG in ${HARBOURS[@]}; do
 echo "+-------------------------------------------------------------------+"
 echo " *** Building TAG: :$TAG *** "
 echo "+-------------------------------------------------------------------+"
 docker build -t $REPO:$TAG $TAG/
done

docker tag $REPO:$TAG_LATEST $REPO:latest

docker tag $REPO:hb_34_latest $REPO:3
docker tag $REPO:hb_34_latest $REPO:3.4
docker tag $REPO:hb_34_latest $REPO:3.4.0
docker tag $REPO:hb_34_latest $REPO:3.4.0dev

docker tag $REPO:hb_32_latest $REPO:3.2
