#
# Copyright (C) 2020-2024 Hadad <hadad@linuxmail.org>
#
# THIS DOCKER ONLY USE FOR BUILDING ANDROID OPEN SOURCE PROJECT.
# DON'T SELLING/BUYING THIS DOCKER TO GET MONEY.
# 

FROM hadadrjt/ubuntu:latest

MAINTAINER Hadad <hadad@linuxmail.org>
LABEL maintainer="Hadad <hadad@linuxmail.org>"

ENV HOSTNAME=android-build-team
ENV PATH /usr/local/bin:$PATH
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN sudo fallocate -l 8G
RUN sudo chmod 600 /swapfile
RUN sudo mkswap /swapfile
RUN sudo swapon /swapfile
RUN sudo cp /etc/fstab /etc/fstab.bak
RUN echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
