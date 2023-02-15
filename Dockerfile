FROM ubuntu:focal-20220531
RUN apt-get update
RUN apt install -y cmake
RUN apt install -y build-essential
RUN apt install -y make python3
RUN apt install -y pip
RUN pip install numpy
RUN apt install -y git

RUN cd /
RUN git clone https://github.com/llvm/llvm-project.git
WORKDIR llvm-project
RUN git checkout 7eb046624f2a35f32f0821c91ad5c6a26f250e5f
RUN mkdir build
WORKDIR build
RUN cmake -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_ASSERTIONS=On -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm
RUN make -j 6

WORKDIR /