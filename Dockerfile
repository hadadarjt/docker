#
# Copyright (C) 2020-2024 Hadad <hadad@linuxmail.org>
#
# THIS DOCKER ONLY USE FOR BUILDING ANDROID OPEN SOURCE PROJECT.
# DON'T SELLING/BUYING THIS DOCKER TO GET MONEY.
# 

FROM hadadrjt/aosp:latest

MAINTAINER Hadad <hadad@linuxmail.org>
LABEL maintainer="Hadad <hadad@linuxmail.org>"

ENV HOSTNAME=android-build-team
ENV PATH /usr/local/bin:$PATH
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN zfs create -V 8G -b $(getconf PAGESIZE) -o logbias=throughput -o sync=always -o primarycache=metadata -o com.sun:auto-snapshot=false rpool/swap
RUN mkswap -f /dev/zvol/rpool/swap
RUN swapon /dev/zvol/rpool/swap
RUN echo '/dev/zvol/rpool/swap none swap discard 0 0' | sudo tee -a /etc/fstab
RUN free -h

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
