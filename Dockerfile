FROM ubuntu as builder

RUN apt-get update && apt-get install -y \
    bash \
    git \
    gcc \
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
    libexpat1-dev

ENV HB_WITH_OPENSSL=yes
ENV HB_BUILD_DYN=yes
ENV HB_BUILD_CONTRIB_DYN=yes
