#!/bin/bash

if ( id ${USER} ); then
  echo "User ${USER} already exists, will not recreate"
else
  ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${PASS})
  useradd -d /data -m -p ${ENC_PASS} -u 1000 -s /bin/sh ${USER}
fi

exec /usr/sbin/sshd -D
