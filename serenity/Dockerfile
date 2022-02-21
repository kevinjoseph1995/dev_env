FROM nvcr.io/nvidia/cudagl:11.4.1-base-ubuntu20.04
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility,graphics,compat32,display

RUN apt update

ENV DEBIAN_FRONTEND noninteractive

RUN apt install -y \
        build-essential \
        cmake \
	    curl \
	    libmpfr-dev \
        libmpc-dev \
        libgmp-dev \
        e2fsprogs \
        ninja-build \
        qemu-system-gui \
        qemu-system-x86 \
        qemu-utils \
        ccache \
        rsync \
        unzip \
        texinfo \
        vim \
        zsh


RUN apt install -y software-properties-common && add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt install -y gcc-11 g++-11 gcc-11-multilib

# QEMU build requirements
RUN apt install -y libgtk-3-dev libpixman-1-dev libsdl2-dev libspice-server-dev

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 20
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 20

RUN curl  -LO https://ftp.gnu.org/gnu/binutils/binutils-2.38.tar.gz && tar -xzf binutils-2.38.tar.gz && \
    cd binutils-2.38 && ./configure && make -j 8 && make install 

RUN cd / && rm -r binutils*
