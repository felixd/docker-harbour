# Harbour Project xBase compiler on Docker

* Git: https://github.com/felixd/docker-harbour
* Docker: https://hub.docker.com/r/elmarit/harbour

## Docker Hub

### Build Environment Containers

Below you can get Build Environment based on Ubuntu

* **build_base**: Base environment configuration. Required packages are installed. No compiller is installed

```
docker pull elmarit/harbour:build_base
```

* **build_clang6**: **build_base** + clang6 build environment

```
docker pull elmarit/harbour:build_clang6
```

* **build_clang7**: **build_base** + clang7 build environment

```
docker pull elmarit/harbour:build_clang7
```

Using `harbour:build` two containers are created

### Harbour Core project (3.2)

https://github.com/harbour/core


```
docker pull elmarit/harbour:hb32
```

### Harbour Viktor Szakats fork (3.4.0dev)

https://github.com/vszakats/harbour-core

```
docker pull elmarit/harbour:hb34
```

## Advantage Client Engine - Advantage Database Server (ADS) header files

Header files can be found under below link. 

http://devzone.advantagedatabase.com/dz/content.aspx?Key=20&Release=19&Product=5

Download client, install it and point to header files using **HB_WITH_ADS**. Then recompile **contrib/** folder

```
export HB_WITH_ADS=/path/to/ace.h
```

![Harbour Project Logo](https://harbour.github.io/images/harbour.svg "Harbour Project Logo")

## Authors

* Paweł 'felixd' Wojciechowski : [Outsourcing IT - Konopnickiej.Com](https://konopnickiej.com)
