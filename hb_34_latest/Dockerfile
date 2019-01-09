FROM elmarit/harbour:compiler_default as build

ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang

# Viktor Szakats 3.4 version
RUN git clone --depth=1 https://github.com/vszakats/harbour-core.git $HB_SRC_ROOTPATH
# Number of concurent jobs during make set to 8
RUN cd $HB_SRC_ROOTPATH && make -j 8 install
