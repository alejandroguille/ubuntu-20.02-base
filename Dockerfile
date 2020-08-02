FROM ubuntu:20.04

ARG USER
ENV USER=${USER}

ARG PASS
ENV PASS=${PASS}

RUN apt update
RUN apt install apt-transport-https ca-certificates curl \ 
    docker-compose software-properties-common openssh-server sudo git -y

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt install docker-ce
RUN systemctl status docker
RUN usermod -aG docker USER
RUN su - USER

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 $USER 
RUN usermod -aG sudo $USER
RUN service ssh start

RUN echo "$USER:$PASS" | chpasswd
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

EXPOSE 22
EXPOSE 80

CMD ["/usr/sbin/sshd","-D"]

#docker build . --tag alejandroguille/ubuntu-20.04-base --build-arg USER='alejo' --build-arg PASS='pepe'
#docker run --publish 22:5000 80:8887 --name ubuntu-20.02 alejandroguille/ubuntu-20.04-base

