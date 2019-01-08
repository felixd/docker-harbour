# Harbour Project xBase compiler on Docker

* Git: https://github.com/felixd/docker-harbour
* Docker: https://hub.docker.com/r/elmarit/harbour

## Docker Hub

### Containers

All containers are build on top of `ubuntu:latest`. Other layers are created as shown below:

```
+-------------------------------+
|         ubuntu:latest         |
+-------------------------------+
|           build_base          |   # packages / libraries / ENV
+-------------------------------+
| clang6 | clang7 |   other...  |   # C/C++ compilers
+-------------------------------+
|  Harbour 3.2  |  Harbour 3.4  |   # Harbour Project
+-------------------------------+
```

### Build Base

#### :build_base / :build_ubuntu_latest

* **[build_ubuntu_latest/Dockerfile](build_ubuntu_latest/Dockerfile)**: 

Packages and libraries required by Harbour Project to be properly compiled are installed and set. No C/C++ compilers are installed in this layer.

```
docker pull elmarit/harbour:build_base
docker pull elmarit/harbour:build_ubuntu_latest
```

### C/C++ compilers

#### :compiler_clang6

**[compiler_clang6/Dockerfile](compiler_clang6/Dockerfile)**

```
docker pull elmarit/harbour:compiler_clang6
```

#### :compiler_clang7

**[compiler_clang7/Dockerfile](compiler_clang7/Dockerfile)**

```
docker pull elmarit/harbour:compiler_clang7
docker pull elmarit/harbour:compiler_default
```

### Harbour Project

#### Harbour Core project (3.2)

https://github.com/harbour/core

```
docker pull elmarit/harbour:3.2
```

#### Harbour Viktor Szakats fork (3.4.0dev)

https://github.com/vszakats/harbour-core

```
docker pull elmarit/harbour:3
docker pull elmarit/harbour:3.4
docker pull elmarit/harbour:3.4.0
docker pull elmarit/harbour:3.4.0.dev
docker pull elmarit/harbour:latest
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
