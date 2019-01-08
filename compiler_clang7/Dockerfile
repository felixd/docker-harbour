FROM elmarit/harbour:build_base

# Clang/LLVM 
# http://apt.llvm.org/
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    printf "\ndeb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main\n" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y clang-7 lldb-7 lld-7 libclang-7-dev libllvm7 llvm-7 llvm-7-dev llvm-7-runtime && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 1000 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 1000 && \
    update-alternatives --config clang && \
    update-alternatives --config clang++

# Clang Include PATHs
ENV CPATH=$CPATH:/usr/local/include:/usr/include/:/usr/include/x86_64-linux-gnu/:/usr/local/include/harbour/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/harbour/

# Harbour config
ENV HB_PLATFORM=linux
ENV HB_COMPILER=clang
