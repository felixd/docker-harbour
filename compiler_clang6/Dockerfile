FROM elmarit/harbour:build_base

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

# Clang Include PATHs
ENV CPATH=$CPATH:/usr/local/include:/usr/include/:/usr/include/x86_64-linux-gnu/:/usr/local/include/harbour/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/harbour/

# Harbour config
ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang
