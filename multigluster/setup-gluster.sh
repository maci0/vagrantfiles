#!/bin/sh
set -e

sudo yum -y  install glusterfs-server nfs-utils

sudo systemctl start glusterd.service rpcbind.service
sudo systemctl enable glusterd.service rpcbind.service
