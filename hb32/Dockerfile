FROM elmarit/harbour:build as build

ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang

# Harbour Projecet - Core 3.2 version
RUN git clone --depth=1 https://github.com/harbour/core.git /harbour

RUN cd /harbour && make install

# RUN fakeroot debian/rules binary
