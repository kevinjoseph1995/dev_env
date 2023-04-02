FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

FROM ubuntu:22.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        ccache \
        cmake \
        curl \
        g++-12 \
        gcc-12 \
        libstdc++-12-dev \
        e2fsprogs \
        genext2fs \
        git \
        imagemagick \
        libgmp-dev \
        libgtk-3-dev \
        libmpc-dev \
        libmpfr-dev \
        libpixman-1-dev \
        libsdl2-dev \
        libspice-server-dev \
        ninja-build \
        qemu-utils \
        rsync \
        sudo \
        texinfo \
        tzdata \
        unzip

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 900 --slave /usr/bin/g++ g++ /usr/bin/g++-12


RUN apt-get install -y wget
RUN apt-get install -y bsdmainutils
RUN apt-get install -y python3-dev
RUN apt-get install -y tmux
RUN apt-get install -y  git-all
RUN apt-get -y install gdb
RUN apt install -y clang-format
RUN apt-get install -y software-properties-common
RUN apt-get install -y lsb-release
RUN apt-get -y update && apt-get install -y libssl-dev
RUN apt-get install -y bash-completion
RUN apt-get install -y bat
RUN apt-get install -y exa
RUN apt-get install -y genext2fs

RUN rm -rf /var/lib/apt/lists/