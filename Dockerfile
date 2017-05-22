FROM ubuntu:14.04
MAINTAINER Sahaj Sarup "sahajsarup@gmail.com"

RUN apt-get update && apt-get install -y \
	bc build-essential git ncurses-dev sudo vim tmux \
	git-core gnupg flex bison gperf build-essential \
 	zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
 	lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
 	libgl1-mesa-dev libxml2-utils xsltproc unzip nano htop \
	openjdk-7-jre openjdk-7-jdk python python-mako gettext


USER root
WORKDIR /root

RUN mkdir ~/bin
ENV PATH=~/bin:$PATH
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
RUN chmod a+x ~/bin/repo
RUN echo 'USER=$(id -un)' >> ~/.bashrc

ENTRYPOINT ["bash", "-l"]
