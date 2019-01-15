# Harbour Project xBase compiler on Docker

[![Build Status](https://travis-ci.org/felixd/docker-harbour.svg?branch=master)](https://travis-ci.org/felixd/docker-harbour)

* Github: https://github.com/felixd/docker-harbour
* Docker Hub: https://hub.docker.com/r/elmarit/harbour

## Harbour

* [Harbour Core (3.2)](https://github.com/harbour/core)
* [Harbour 3.4 (Viktor Szakats)](https://github.com/vszakats/harbour-core)

## Examples

[![Build Status](https://travis-ci.org/felixd/docker-harbour-example.svg?branch=master)](https://travis-ci.org/felixd/docker-harbour-example) 

https://github.com/felixd/docker-harbour-example

## Docker Hub

### Images

All images are build on top of `ubuntu:latest`. Other layers are created as shown below:

```
+----------------------------+
| ubuntu:latest              |
+----------------------------+
| elmarit/harbour:build_*    |   # 1. Packages / libraries / ENV variables needed to build
+----------------------------+        Harbour Projects are installed
| elmarit/harbour:compiler_* |   # 2. C/C++ compilers are installed on top of :build_* layer
+----------------------------+
| elmarit/harbour:hb_*       |   # 3. Harbour Projects are compiled using :compiler_* layer
+----------------------------+
```

### Default tags

```
 elmarit/harbour:build              =>   elmarit/harbour:build_ubuntu_latest
 elmarit/harbour:build_base         =>   elmarit/harbour:build_ubuntu_latest

 elmarit/harbour:compiler           =>   elmarit/harbour:compiler_clang7
 elmarit/harbour:compiler_default   =>   elmarit/harbour:compiler_clang7

 elmarit/harbour:latest             =>   elmarit/harbour:hb_34_latest
```

### Build

Image contains packages and libraries required by Harbour Project to be properly compiled. No C/C++ compilers are installed in this layer.

#### :build / :build_base / :build_ubuntu_latest

* **[build_ubuntu_latest/Dockerfile](build_ubuntu_latest/Dockerfile)**: 

```bash
docker pull elmarit/harbour:build_ubuntu_latest

docker pull elmarit/harbour:build
docker pull elmarit/harbour:build_base
```

### C/C++ compilers

In this layer C/C++ compiler images are created. They can be used to build any Harbour Project version you need.

#### Clang 6

**[compiler_clang6/Dockerfile](compiler_clang6/Dockerfile)**

```bash
docker pull elmarit/harbour:compiler_clang6
```

#### Clang 7

**[compiler_clang7/Dockerfile](compiler_clang7/Dockerfile)**

```bash
docker pull elmarit/harbour:compiler_clang7

docker pull elmarit/harbour:compiler
docker pull elmarit/harbour:compiler_default
```

#### Clang 8

**[compiler_clang8/Dockerfile](compiler_clang8/Dockerfile)**

```bash
docker pull elmarit/harbour:compiler_clang8
```

### Harbour Project

#### Harbour Core project (3.2)

https://github.com/harbour/core

```bash
docker pull elmarit/harbour:3.2
```

#### Harbour Viktor Szakats fork (3.4.0dev)

https://github.com/vszakats/harbour-core

```bash
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

```bash
export HB_WITH_ADS=/path/to/ace.h
```

![Harbour Project Logo](https://harbour.github.io/images/harbour.svg "Harbour Project Logo")

## Authors

* Paweł 'felixd' Wojciechowski : [Outsourcing IT - Konopnickiej.Com](https://konopnickiej.com)
