class avahi {
  file { "/etc/avahi/avahi-daemon.conf":
    notify  => Service["avahi-daemon"],
    require => Package["avahi"],
  }
  package { "avahi":
    ensure => installed,
  }
  package { "avahi-autoipd":
    ensure => installed,
  }
  package { "avahi-tools":
    ensure => installed,
  }
  package { "nss-mdns":
    ensure => installed,
  }
  service { "avahi-daemon":
    ensure    => running,
    enable    => true,
    require => Exec["avahi-daemon.conf"],
  }
  exec { 'avahi-daemon.conf':
     command => "/bin/sed -i 's/browse-domains=0pointer.de, zeroconf.org/#browse-domains=0pointer.de, zeroconf.org/' /etc/avahi/avahi-daemon.conf",
   }
  exec { 'nsswitch.conf':
     command => "/bin/sed -i 's/hosts:      files mdns4_minimal [NOTFOUND=return] dns/hosts: files myhostname mdns_minimal [NOTFOUND=return] dns/' /etc/nsswitch.conf",
   }
}
