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


# Zig nightly master
RUN pacman -S --needed --noconfirm wget
RUN wget https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2892+fd6200eda.tar.xz
RUN mkdir zig_temp &&  tar -xf zig-linux-x86_64-0.11.0-dev.2892+fd6200eda.tar.xz -C zig_temp
RUN mv zig_temp/*/* zig_temp && mv zig_temp/zig /usr/local/bin && mkdir /usr/local/lib/zig && mv zig_temp/lib/*  /usr/local/lib/zig
RUN rm -f /zig-linux-x86_64-0.11.0-dev.2892+fd6200eda.tar.xz && rm -rf /zig_temp
