class avahi {
  exec { "disableselinux":
    command => "/usr/bin/sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config",
  }
  exec { "setenforce":
    command => "/usr/sbin/setenforce 0",
  }
}
