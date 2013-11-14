class avahi {

file { "/etc/avahi/avahi-daemon.conf":
    notify  => Service["avahi-daemon"],
    require => Package["avahi-daemon"],
}

  package { "avahi-daemon":
    ensure => installed,
  }
  package { "avahi-tools":
    ensure => installed,
  }
  package { "nss-mdns":
    ensure => installed,
  }
  service { "avahi-daemon":
    provider => systemd,
    ensure    => running,
    enable    => true,
  }

  exec { 'avahi-daemon.conf':
     command => "/bin/sed -i 's/browse-domains=0pointer.de, zeroconf.org/#browse-domains=0pointer.de, zeroconf.org/' /etc/avahi/avahi-daemon.conf",
   }
   
  exec { 'nsswitch.conf':
     command => "/bin/sed -i 's/hosts:      files mdns4_minimal [NOTFOUND=return] dns/hosts: files myhostname mdns_minimal [NOTFOUND=return] dns/' /etc/nsswitch.conf",
   }

}
