FROM ubuntu:23.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

COPY bash.bashrc /etc/bash.bashrc
RUN  chmod a+rwx /etc/bash.bashrc

RUN apt-get -y update

# rust toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

RUN apt-get install -y wget
RUN apt-get install -y bsdmainutils
RUN apt-get install -y python3-dev
RUN apt-get install -y curl
RUN apt-get install unzip
RUN apt-get install -y  git-all
RUN apt-get -y install gdb
RUN apt-get install -y build-essential
RUN apt-get install -y ninja-build
RUN apt install -y clang-format
RUN apt-get install -y software-properties-common
RUN apt-get install -y lsb-release
RUN apt-get -y update && apt-get install -y libssl-dev
RUN apt-get -y install binutils-dev
RUN apt-get install -y bash-completion
RUN apt-get -y install exa 