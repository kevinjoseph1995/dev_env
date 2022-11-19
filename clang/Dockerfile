FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

COPY bash.bashrc /etc/bash.bashrc
RUN  chmod a+rwx /etc/bash.bashrc

ENV DEBIAN_FRONTEND noninteractive

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
RUN apt-get install -y fish
RUN apt-get install -y software-properties-common
RUN apt-get install -y lsb-release
RUN apt-get -y update && apt-get install -y libssl-dev
RUN apt-get install -y bash-completion
RUN apt-get install -y bat

# Neovim
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim

# CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.23.4/cmake-3.23.4-linux-x86_64.sh && \
    bash ./cmake-3.23.4-linux-x86_64.sh --skip-license --include-subdir --prefix=/ && rm ./cmake-3.23.4-linux-x86_64.sh && \
    cd cmake-3.23.4-linux-x86_64 && cp -r share/* /usr/share && cp -r bin/* /usr/bin && cd .. && rm -r cmake-3.23.4-linux-x86_64


# Mold
RUN cd / && git clone https://github.com/rui314/mold.git && cd mold && git checkout v1.6.0 && make -j$(nproc) CXX=g++ && make install && cd / && rm -rf /mold

# ccache
RUN wget --directory-prefix=/tmp https://github.com/ccache/ccache/releases/download/v4.7.2/ccache-4.7.2.tar.gz
RUN cd /tmp && tar -xvzf ccache-4.7.2.tar.gz && cd ccache-4.7.2/ && mkdir build
RUN cd /tmp/ccache-4.7.2/build && cmake -DZSTD_FROM_INTERNET=ON -DCMAKE_INSTALL_PREFIX=/usr .. && make -j && make install

# GCC
RUN apt-get update  && apt-get install -y gcc-12 g++-12 libstdc++-12-dev

# LLVM/Clang
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
# Set Clang as the default compiler, cmake can take it from here
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-15 30
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-15 30
RUN ln -s /usr/bin/clangd-15 /usr/bin/clangd
