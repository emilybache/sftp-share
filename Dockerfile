FROM ubuntu:14.04

MAINTAINER Emily Bache

# should be overriden when you start the docker container
ENV USER share
ENV PASS changeme

RUN apt-get update && \
    apt-get install -y openssh-server mcrypt && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /usr/local/bin/start.sh
ADD sshd_config /etc/ssh/sshd_config

VOLUME ["/data"]
VOLUME ["/etc/ssh/keys"]

EXPOSE 22

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]

