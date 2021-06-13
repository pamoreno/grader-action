FROM orgacomp/common

RUN apt update \ 
    && apt install -y \
        clang-format \
        gcc-7 \
        git \
        perl \
        unzip \
        valgrind \
    && apt-get clean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

#ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/bin/bash", "-c"]
