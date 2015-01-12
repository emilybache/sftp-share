FROM ubuntu:14.04

MAINTAINER Emily Bache

# can be overriden when you start the docker container
ENV USER share

# must be set when you start the docker container
ENV PASS changeme
ENV PUBLIC_SERVER_HOST_KEY  = changeme
ENV PRIVATE_SERVER_HOST_KEY = changeme

RUN apt-get update && \
    apt-get install -y openssh-server mcrypt && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /usr/local/bin/start.sh
ADD sshd_config /etc/ssh/sshd_config

VOLUME ["/data"]
EXPOSE 22

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]

