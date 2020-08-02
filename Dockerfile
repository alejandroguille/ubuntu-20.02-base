FROM ubuntu:20.04

ARG USER="alejo"
ARG PASS="pepe"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt install apt-transport-https ca-certificates curl \ 
    docker-compose software-properties-common openssh-server sudo git -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 $USER 
RUN usermod -aG docker $USER
RUN usermod -aG sudo $USER
RUN service ssh start

RUN echo "$USER:$PASS" | chpasswd
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

EXPOSE 22
EXPOSE 80

CMD ["/usr/sbin/sshd","-D"]

