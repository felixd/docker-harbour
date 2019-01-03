FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    bash \
    git \
    gcc \
    wget \
    make \
    binutils \
    fakeroot \
    debhelper \
    valgrind \
    libncurses-dev \
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
    qtbase5-dev \
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

ENV HB_WITH_OPENSSL=yes
ENV HB_BUILD_DYN=yes
ENV HB_BUILD_CONTRIB_DYN=yes
