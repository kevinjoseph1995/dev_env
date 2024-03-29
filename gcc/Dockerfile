FROM ubuntu:23.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

COPY bash.bashrc /etc/bash.bashrc
RUN  chmod a+rwx /etc/bash.bashrc

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update

RUN apt-get install -y software-properties-common
RUN apt-get install -y lsb-release
RUN apt-get install -y wget
RUN apt-get -y update && apt-get install -y libssl-dev
RUN apt-get install -y bsdmainutils
RUN apt-get install -y python3-dev
RUN apt-get install -y  git-all
RUN apt-get install -y curl
RUN apt-get install -y build-essential
RUN apt-get install -y bash-completion
RUN apt-get -y install gdb
RUN apt-get install -y ninja-build
RUN apt-get install unzip

# CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-linux-x86_64.sh && \
    bash ./cmake-3.26.3-linux-x86_64.sh --skip-license --include-subdir --prefix=/ && rm ./cmake-3.26.3-linux-x86_64.sh && \
    cd cmake-3.26.3-linux-x86_64 && cp -r share/* /usr/share && cp -r bin/* /usr/bin && cd .. && rm -r cmake-3.26.3-linux-x86_64

# Mold linker
RUN cd / && \
    git clone https://github.com/rui314/mold.git && \
	cd mold && \
	git checkout v1.11.0 && \
    ./install-build-deps.sh && \
	mkdir build && cd build && \
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ .. && \
	cmake --build . -j $(nproc) && \
	cmake --install . && \
	cd / && rm -rf /mold

# ccache
RUN wget --directory-prefix=/tmp https://github.com/ccache/ccache/releases/download/v4.8/ccache-4.8.tar.gz
RUN cd /tmp && tar -xvzf ccache-4.8.tar.gz && cd ccache-4.8/ && mkdir build
RUN cd /tmp/ccache-4.8/build && cmake -DZSTD_FROM_INTERNET=ON -DCMAKE_INSTALL_PREFIX=/usr .. && make -j && make install

# Stack trace libraries
RUN apt-get install -y  libdw-dev libdwarf-dev binutils-dev

# GCC-13
RUN apt-get install -y gcc-13 g++-13
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-13 30
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-13 30

# Utils
RUN apt-get install -y tmux
RUN apt install -y clang-format
RUN apt-get install -y bat
RUN apt-get install -y valgrind
RUN apt-get install -y ripgrep
RUN apt-get install -y clangd