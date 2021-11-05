FROM ubuntu:20.04

# no questions from apt
ENV DEBIAN_FRONTEND=noninteractive 

RUN  apt-get update -y; \
	  apt-get install --fix-missing -y \
		  clang-format \
		  coreutils \
		  git \
		  ninja-build \
		  p7zip-full \
		  pigz \
		  software-properties-common

RUN apt-get install --fix-missing -y \
          binutils-mingw-w64-x86-64 g++-mingw-w64-x86-64 gcc-mingw-w64-x86-64
		  
RUN apt-get install cmake -y

COPY scripts /scripts

VOLUME /publish

ENTRYPOINT ["/bin/sh", "/scripts/build.sh"]
