FROM ubuntu:20.04

#ARG BRANCHNAME=BAR105
#ARG GITHUB_REPOSITORY=verybadsoldier/spring
#ARG GITHUB_REPOSITORY_OWNER=verybadsoldier

# no question from apt
ENV DEBIAN_FRONTEND=noninteractive 

RUN  apt-get update -y; \
	  apt-get install --fix-missing -y \
		  coreutils \
		  p7zip-full \
		  clang-format \
		  ninja-build \
		  git \
		  software-properties-common \
		  pigz
			  
RUN apt-get install --fix-missing -y \
          binutils-mingw-w64-x86-64 g++-mingw-w64-x86-64 gcc-mingw-w64-x86-64
		  
RUN apt-get install cmake -y
		  
COPY scripts /
#RUN sh /tmp/build.sh