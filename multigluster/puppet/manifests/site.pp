import "classes/*"

node default {
  include ntp
  include glusterfs
  include firewall
  include avahi
  include zfs

  exec { "hostnameconfig":
    command => "/usr/bin/hostname > /etc/hostname",
  }
  exec { "disableselinux":
    command => "/usr/bin/sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config",
  }
  exec { "setenforce":
    command => "/usr/sbin/setenforce 0",
  }
}
