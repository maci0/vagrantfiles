class glusterfs {
  package { "glusterfs-server":
    ensure => installed,
  }
  package { "nfs-utils":
    ensure => installed,
  }
  service { "rpcbind":
    provider => systemd,
    ensure    => running,
    enable    => true,
  }
  service { "glusterd":
    provider => systemd,
    ensure    => running,
    enable    => true,
  }

}
