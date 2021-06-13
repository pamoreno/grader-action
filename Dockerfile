FROM orgacomp/common

RUN apt install -y \
    clang-format \
    gcc-7 \
    git \
    perl \
    python3-pip
    unzip \
    valgrind \
    && pip3 install unicorn keystone-engine

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
