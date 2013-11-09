#!/bin/sh

HOSTNAME=`hostname -s`
NODES=`avahi-browse -t _gluster._tcp | tr ' ' '\n' | grep -v ${HOSTNAME} | grep node | uniq`
for NODE in ${NODES}; do
  echo ${NODE}
  sudo gluster peer probe ${NODE}.local
done
