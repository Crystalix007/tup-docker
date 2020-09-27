FROM bitnami/minideb:latest

WORKDIR /home
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y git gcc libfuse3-dev libpcre3-dev gcc-multilib pkg-config fuse3
RUN git clone git://github.com/Crystalix007/tup.git && cd tup && git checkout docker && ./build-docker.sh
RUN cp tup/tup /bin/tup && rm -rf tup
WORKDIR /home/src
