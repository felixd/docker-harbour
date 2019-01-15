FROM elmarit/harbour:compiler_default as build
ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang

# HB_SRC_ROOTPATH is set in elmarit/harbour:build_base Dockerfile

# Harbour Projecet - Core 3.2 version
RUN git clone --depth=1 https://github.com/harbour/core.git $HB_SRC_ROOTPATH
# Number of concurent jobs during make set to 8
RUN cd $HB_SRC_ROOTPATH && make -j 8 install
RUN hbtest --all