FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    bash \
    git \
    wget \
    make \
    apt-utils \
    binutils \
    fakeroot \
    debhelper \
    valgrind \
    libncurses-dev \
    librabbitmq-dev \
    libgpm-dev \
    libcurl4-openssl-dev \
    libmysqlclient-dev \
    libssl-dev \
    libslang2-dev \
    libx11-dev \
    liballegro5-dev \
    libcairo2-dev \
    libcups2-dev \
    firebird-dev \
    libfreeimage-dev \
    libgd-dev \
    libgs-dev \
    libmagic-dev \
    unixodbc-dev \
    libpq-dev \
    libqt4-dev \
# Optional, to override locally hosted sources:
    libbz2-dev \
    zlib1g-dev \
    libpcre3-dev \
    libsqlite3-dev \
    libexpat1-dev \
# Fakeroot for Debian/Ubuntu packages builds
    fakeroot && rm -rf /var/lib/apt/lists/*

# Clang/LLVM 
# http://apt.llvm.org/
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    printf "\ndeb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main\n" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y clang-6.0 lldb-6.0 lld-6.0 libclang-6.0-dev libllvm6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-runtime && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 1000 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 1000 && \
    update-alternatives --config clang && \
    update-alternatives --config clang++

# Clang Include PATH
ENV CPATH=$CPATH:/usr/local/include:/usr/include/:/usr/include/x86_64-linux-gnu/

# Packages for Harbour builds

# OCILIB - C and C++ Drivers for Oracle
# https://github.com/vrogier/ocilib
RUN git clone --depth=1 https://github.com/vrogier/ocilib /hblibs/ocilib
ENV HB_WITH_OCILIB=/hblibs/ocilib/include/
