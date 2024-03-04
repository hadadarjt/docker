#
# Copyright (C) 2020-2024 Hadad <hadad@linuxmail.org>
#
# THIS DOCKER ONLY USE FOR BUILDING ANDROID OPEN SOURCE PROJECT.
# DON'T SELLING/BUYING THIS DOCKER TO GET MONEY.
# 

FROM ubuntu:22.04

MAINTAINER Hadad <hadad@linuxmail.org>
LABEL maintainer="Hadad <hadad@linuxmail.org>"

ENV HOSTNAME=android-build-team
ENV PATH /usr/local/bin:$PATH
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get full-upgrade -y
RUN apt-get install tzdata locales --no-install-recommends -y
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install sudo bc bash ccache git-core git-lfs gnupg \
		    gnupg2 build-essential libbluetooth-dev \
		    libbz2-dev libexpat1-dev libffi-dev apt-utils \
		    zip curl make automake autogen autoconf \
		    autotools-dev libtool shtool python2 python3 \
		    python3-pip python3-dev python-is-python3 \
		    libgdbm-dev libxml2-dev m4 gcc gcc-multilib \
		    libtool zlib1g-dev flex bison libssl-dev \
		    nano unzip tar xz-utils libreadline-dev \
		    libsqlite3-dev libxslt-dev schedtool \
		    software-properties-common ca-certificates \
		    netbase tk-dev uuid-dev libpq-dev libtinfo5 \
		    lzop libncurses5 wget aria2 rclone screen libc6 \
		    libc6-dev neofetch android-tools-mkbootimg \
		    figlet p7zip-full lib32ncurses5-dev liblzma-dev \
		    libncursesw5-dev dos2unix libxml-simple-perl \
		    tmux x11proto-core-dev libx11-dev jq \
		    lib32z1-dev libgl1-mesa-dev libxml2-utils \
		    xsltproc fontconfig imagemagick patchelf apktool \
		    dos2unix libxml-simple-perl default-jdk \
		    default-jre -q -y

RUN git clone https://github.com/akhilnarang/scripts
RUN sudo bash scripts/setup/android_build_env.sh
RUN rm -rf scripts

RUN git clone https://github.com/ShivamKumarJha/android_tools
RUN sudo bash android_tools/setup.sh
RUN rm -rf android_tools

RUN git config --global user.name "user"
RUN git config --global user.email "user@mail.com"
RUN git config --global color.ui true
RUN git config --global http.postBuffer 2147483648

RUN apt-get clean --dry-run

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
