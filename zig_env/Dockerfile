FROM archlinux:latest

RUN pacman --noconfirm -Syu

# Git
RUN pacman --noconfirm -S git

# Base utils
RUN pacman -S --needed --noconfirm base-devel zlib openssl cmake util-linux

# Mold linker
RUN cd / && \
    git clone https://github.com/rui314/mold.git && \
	cd mold && \
	git checkout v1.11.0 && \
	mkdir build && cd build && \
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ .. && \
	cmake --build . -j $(nproc) && \
	cmake --install . && \
	cd / && rm -rf /mold

# Ziggy zig
RUN pacman --noconfirm -S zig