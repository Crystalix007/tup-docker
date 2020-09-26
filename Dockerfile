FROM bitnami/minideb:latest

WORKDIR /home
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y git gcc libfuse3-dev libpcre3-dev gcc-multilib
RUN git clone git://github.com/Crystalix007/tup.git && cd tup && printf 'CONFIG_TUP_SERVER=ldpreload\n' > tup.config && ./bootstrap-ldpreload.sh
RUN cp tup/tup /bin/tup && rm -rf tup
WORKDIR /home/src
