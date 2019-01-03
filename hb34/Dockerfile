FROM elmarit/harbour:build as build

ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang

# Viktor Szakats 3.4 version
RUN git clone --depth=1 https://github.com/vszakats/harbour-core.git /harbour

RUN cd /harbour && make install
