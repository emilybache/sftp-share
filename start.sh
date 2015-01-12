#!/bin/bash

ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${PASS})

if ( id ${USER} ); then
  echo "FATAL: User ${USER} already exists"
  exit 1
fi

useradd -d /data -m -p ${ENC_PASS} -u 1000 -s /bin/sh ${USER}

echo $PUBLIC_SERVER_HOST_KEY > /etc/ssh/ssh_host_rsa_key.pub
echo $PRIVATE_SERVER_HOST_KEY > /etc/ssh/ssh_host_rsa_key

exec /usr/sbin/sshd -D
