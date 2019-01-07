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

### Base

#### :build_base

* **[build_base/Dockerfile](build_base/Dockerfile)**: 

Packages and libraries required by Harbour Project to be properly compiled are installed and set. No C/C++ compilers are installed in this layer.

```
docker pull elmarit/harbour:build_base
```

### C/C++ compilers

#### :build_clang6

**[build_clang6/Dockerfile](build_clang6/Dockerfile)**

```
docker pull elmarit/harbour:build_clang6  
```

#### :build_clang7 (default :build)

**[build_clang7/Dockerfile](build_clang7/Dockerfile)**

```
docker pull elmarit/harbour:build_clang7
```

### Harbour Project

Using `harbour:build` (default build container) Harbour Projects are compiled.

#### Harbour Core project (3.2)

https://github.com/harbour/core

```
docker pull elmarit/harbour:hb32
```

#### Harbour Viktor Szakats fork (3.4.0dev)

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
