FROM elmarit/harbour:compiler_default as build

ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang

# Viktor Szakats 3.4 version
RUN git clone --depth=1 https://github.com/vszakats/harbour-core.git $HB_SRC_ROOTPATH
RUN cd $HB_SRC_ROOTPATH && make install
