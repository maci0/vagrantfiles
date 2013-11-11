class avahi {

  package { "augeas":
    ensure => installed,
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
    ensure    => running,
    enable    => true,
  }

  augeas {"nsswitch ldap first":
    context => "/files/etc/nsswitch.conf",
    changes => [
      "set *[self::database = 'hosts']/service[1] files",
      "set *[self::database = 'hosts']/service[2] ldap",
      "set *[self::database = 'hosts']/service[3] mdns",
      "set *[self::database = 'hosts']/service[4] dns",

      ]
  }
}
