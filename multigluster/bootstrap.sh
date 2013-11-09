#!/bin/sh
set -e
set -x 

sudo sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
sudo setenforce 0

sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

hostname > /etc/hostname

sudo yum clean all

sudo yum -y upgrade
sudo yum -y install ntp

systemctl start ntpdate.service ntpd.service
systemctl enable ntpdate.service ntpd.service

#sh -x /vagrant/setup-zfs.sh
#sh -x /vagrant/setup-gluster.sh
sh -x /vagrant/setup-avahi.sh

exit 0
