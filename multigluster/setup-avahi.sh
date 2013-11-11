#!/bin/sh
set -e

sudo yum -y  install nss-mdns avahi-tools

sudo cp /vagrant/gluster.service /etc/avahi/services
sudo sed -i 's/use-ipv4=yes/use-ipv4=no/' /etc/avahi/avahi-daemon.conf
sudo sed -i 's/use-ipv6=no/use-ipv6=yes/' /etc/avahi/avahi-daemon.conf
sudo sed -i 's/enable-wide-area=yes/enable-wide-area=no/' /etc/avahi/avahi-daemon.conf
sudo sed -i 's/browse-domains=0pointer.de, zeroconf.org/#browse-domains=0pointer.de, zeroconf.org/' /etc/avahi/avahi-daemon.conf
sudo sed -i 's/hosts:      files mdns4_minimal [NOTFOUND=return] dns/hosts: files myhostname mdns_minimal [NOTFOUND=return] dns/' /etc/nsswitch.conf

sudo systemctl restart avahi-daemon.service
