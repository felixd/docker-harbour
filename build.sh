#!/bin/bash

cd build
docker build -t elmarit/harbour:build .
docker push elmarit/harbour:build

cd ../hb32
docker build -t elmarit/harbour:hb32 .
docker push elmarit/harbour:hb32

cd ../hb34
docker build -t elmarit/harbour:hb34 .
docker push elmarit/harbour:hb34
