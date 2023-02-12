FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

COPY bash.bashrc /etc/bash.bashrc
RUN  chmod a+rwx /etc/bash.bashrc

RUN apt-get -y update

RUN apt-get install -y wget
RUN apt-get install -y bsdmainutils
RUN apt-get install -y python3-dev
RUN apt-get install -y curl
RUN apt-get install -y tmux
RUN apt-get install unzip
RUN apt-get install -y  git-all
RUN apt-get -y install gdb
RUN apt-get install -y build-essential
RUN apt-get install -y ninja-build
RUN apt install -y clang-format
RUN apt-get install -y software-properties-common
RUN apt-get install -y lsb-release
RUN apt-get -y update && apt-get install -y libssl-dev
RUN apt-get install -y bash-completion
RUN apt-get -y install binutils-dev
RUN apt-get install -y exa

# Neovim
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim

# gcc-12
RUN apt-get update  && apt-get install -y gcc-12 g++-12 libstdc++6

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 20
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 20

# CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-linux-x86_64.sh && \
    bash ./cmake-3.25.2-linux-x86_64.sh --skip-license --include-subdir --prefix=/ && rm ./cmake-3.25.2-linux-x86_64.sh && \
    cd cmake-3.25.2-linux-x86_64 && cp -r share/* /usr/share && cp -r bin/* /usr/bin && cd .. && rm -r cmake-3.25.2-linux-x86_64

# Mold
RUN cd / && git clone https://github.com/rui314/mold.git && mkdir mold/build && cd mold/build && git checkout v1.10.1 && ../install-build-deps.sh && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ .. && cmake --build . -j $(nproc) && cmake --install . && cd / && rm -rf mold

# ccache
RUN wget --directory-prefix=/tmp https://github.com/ccache/ccache/releases/download/v4.7.2/ccache-4.7.2.tar.gz
RUN cd /tmp && tar -xvzf ccache-4.7.2.tar.gz && cd ccache-4.7.2/ && mkdir build
RUN cd /tmp/ccache-4.7.2/build && cmake -DZSTD_FROM_INTERNET=ON -DCMAKE_INSTALL_PREFIX=/usr .. && make -j && make install

# LLVM/Clang
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
RUN ln -s /usr/bin/clangd-15 /usr/bin/clangd
