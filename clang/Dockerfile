FROM nvcr.io/nvidia/cudagl:11.4.1-base-ubuntu20.04
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility,graphics,compat32,display

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
RUN apt-get install -y zsh
RUN apt-get install -y software-properties-common
RUN apt-get install -y lsb-release

# Neovim
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install neovim

# CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2-linux-x86_64.sh && \
    bash ./cmake-3.22.2-linux-x86_64.sh --skip-license --include-subdir --prefix=/ && rm ./cmake-3.22.2-linux-x86_64.sh && \
    cd cmake-3.22.2-linux-x86_64 && cp -r share/* /usr/share && cp -r bin/* /usr/bin && cd .. && rm -r cmake-3.22.2-linux-x86_64

# ccache
RUN wget --directory-prefix=/tmp https://github.com/ccache/ccache/releases/download/v4.3/ccache-4.3.tar.gz
RUN cd /tmp && tar -xvzf ccache-4.3.tar.gz && cd ccache-4.3/ && mkdir build
RUN cd /tmp/ccache-4.3/build && cmake -DZSTD_FROM_INTERNET=ON -DCMAKE_INSTALL_PREFIX=/usr .. && make -j && make install

# LLVM/Clang
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
# Set Clang as the default compiler, cmake can take it from here
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-14 30
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-14 30
RUN mv /usr/bin/ld /usr/bin/ld.gnu
RUN ln -s /usr/bin/ld.lld-14 /usr/bin/ld

# libstdc++-11
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update  && apt-get install -y libstdc++-11-dev

# Install Bazel
RUN apt install -y apt-transport-https gnupg
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" |  tee /etc/apt/sources.list.d/bazel.list
RUN apt update && apt install bazel