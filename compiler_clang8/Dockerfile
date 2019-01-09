FROM elmarit/harbour:build_base

# Clang/LLVM 
# http://apt.llvm.org/
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    printf "\ndeb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main\n" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y clang-8 lldb-8 lld-8 libclang-8-dev libllvm8 llvm-8 llvm-8-dev llvm-8-runtime && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-8 1000 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-8 1000 && \
    update-alternatives --config clang && \
    update-alternatives --config clang++

# Clang Include PATHs
ENV CPATH=$CPATH:/usr/local/include:/usr/include/:/usr/include/x86_64-linux-gnu/:/usr/local/include/harbour/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/harbour/

# Harbour config
ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang
