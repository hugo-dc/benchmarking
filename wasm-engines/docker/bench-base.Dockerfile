FROM ubuntu:19.10

# System deps
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y software-properties-common git sudo build-essential wget curl nano \
    autoconf automake libtool llvm-6.0 make ninja-build unzip zlib1g-dev texinfo libssl-dev

# Install CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.16.4/cmake-3.16.4.tar.gz
RUN tar -xzvf cmake-3.16.4.tar.gz
RUN cd cmake-3.16.4 && ./bootstrap && make -j4 && make install

# install python 2.7
RUN apt-get install -y python2.7

# install python 3.7
RUN apt-get install -y python3.7 python3-distutils
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.7 get-pip.py
