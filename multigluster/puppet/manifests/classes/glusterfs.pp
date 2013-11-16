class glusterfs {
  file { "/etc/avahi/services/gluster.service":
    notify  => Service["avahi-daemon"],
    require => Service["glusterd"],
    source  => "/vagrant/puppet/files/etc/avahi/services/gluster.service",
  }
  package { "glusterfs-server":
    ensure => installed,
  }
  package { "nfs-utils":
    ensure => installed,
  }
  service { "rpcbind":
    ensure    => running,
    enable    => true,
    require => Package['nfs-utils'],
  }
  service { "glusterd":
    ensure    => running,
    enable    => true,
    require => [ Package['glusterfs-server'], Service['rpcbind'] ],
  }
}
