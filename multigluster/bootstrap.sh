#!/bin/sh
set -e
set -x 

hostname > /etc/hostname
sudo sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
sudo setenforce 0

sudo yum clean all
#sudo yum -y upgrade


#sh -x /vagrant/setup-zfs.sh

exit 0
