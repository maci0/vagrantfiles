class selinux {
  exec { "disableselinux":
    command => "/usr/bin/sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config",
  }
  exec { "setenforce":
    command => "/usr/sbin/setenforce 0",
  }
  exec { "autorelabel":
    command => "/usr/bin/touch ./autorelabel",
  }
}
