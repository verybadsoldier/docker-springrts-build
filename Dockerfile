FROM ubuntu:20.04

# suppress questions from apt
ENV DEBIAN_FRONTEND=noninteractive 

# Install Build Dependencies (Common)
RUN  apt-get update -y; \
	apt-get install --fix-missing -y \
		  clang-format \
		  coreutils \
		  git \
		  ninja-build \
		  p7zip-full \
		  pigz \
		  software-properties-common

# Install Build Dependencies (windows-64)
RUN apt-get install --fix-missing -y \
    binutils-mingw-w64-x86-64 g++-mingw-w64-x86-64 gcc-mingw-w64-x86-64
		  
# GCC-10 PPA (linux-64)
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y; \
    	apt update -y; \
        apt install -y gcc-10 g++-10

# Install Build Dependencies (linux-64)
RUN  apt-get install --fix-missing -y \
        libsdl2-dev \
        libopenal-dev \
        libfreetype6-dev \
        libfontconfig1-dev

RUN apt-get install cmake -y

COPY scripts /scripts

VOLUME /publish

ENTRYPOINT ["/bin/bash", "/scripts/build.sh"]
