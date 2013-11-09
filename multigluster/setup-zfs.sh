#!/bin/sh
set -e

sudo yum -y install http://archive.zfsonlinux.org/fedora/zfs-release-1-2$(rpm -E %dist).noarch.rpm
sudo yum -y  install zfs

sudo systemctl start zfs.service
sudo systemctl enable zfs.service


sudo truncate -s 500G /sdb.img
sudo truncate -s 500G /sdc.img

#zpool create bricks mirror /sdb.img /sdc.img
