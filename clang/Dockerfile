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
RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2-linux-x86_64.sh && \
    bash ./cmake-3.22.2-linux-x86_64.sh --skip-license --include-subdir --prefix=/ && rm ./cmake-3.22.2-linux-x86_64.sh && \
    cd cmake-3.22.2-linux-x86_64 && cp -r share/* /usr/share && cp -r bin/* /usr/bin && cd .. && rm -r cmake-3.22.2-linux-x86_64

# ccache
RUN wget --directory-prefix=/tmp https://github.com/ccache/ccache/releases/download/v4.3/ccache-4.3.tar.gz
RUN cd /tmp && tar -xvzf ccache-4.3.tar.gz && cd ccache-4.3/ && mkdir build
RUN cd /tmp/ccache-4.3/build && cmake -DZSTD_FROM_INTERNET=ON -DCMAKE_INSTALL_PREFIX=/usr .. && make -j && make install

# GCC
RUN apt-get update  && apt-get install -y gcc-12 g++-12 libstdc++-11-dev

# LLVM/Clang
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
# Set Clang as the default compiler, cmake can take it from here
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-15 30
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-15 30

# Mold
RUN cd / && git clone https://github.com/rui314/mold.git && cd mold && git checkout v1.4.0 && make -j$(nproc) CXX=g++ && make install && cd / && rm -rf /mold


# Install Bazel
RUN apt install -y apt-transport-https gnupg
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" |  tee /etc/apt/sources.list.d/bazel.list
RUN apt update && apt install bazel
