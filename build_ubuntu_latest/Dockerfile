FROM ubuntu:latest
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y \
    bash \
    git \
    wget \
    make \
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
    liballegro4-dev \
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
    libicu-dev \
# Optional, to override locally hosted sources:
    libbz2-dev \
    zlib1g-dev \
    libpcre3-dev \
    libsqlite3-dev \
    libexpat1-dev \
# Fakeroot for Debian/Ubuntu packages builds
    fakeroot && rm -rf /var/lib/apt/lists/*

# Other packages for Harbour builds

# OCILIB - C and C++ Drivers for Oracle
# https://github.com/vrogier/ocilib
RUN git clone --depth=1 https://github.com/vrogier/ocilib /hblibs/ocilib
ENV HB_WITH_OCILIB=/hblibs/ocilib/include/

# CURL
ENV HB_WITH_CURL=/usr/include/x86_64-linux-gnu/

# Setting default SRC dir. This variables is used in further builds.
ENV HB_SRC_ROOTPATH=/harbour
