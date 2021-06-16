FROM orgacomp/common

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN apt update \ 
    && apt install -y \
        #clang-format \
        gcc-7 \
        git \
        perl \
        unzip \
        valgrind \
    && apt-get clean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT entrypoint.sh
CMD ["/bin/bash"]
