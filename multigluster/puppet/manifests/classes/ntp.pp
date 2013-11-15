class ntp {
  package { "ntp":
    ensure => installed,
  }
  service { "ntpdate":
    enable    => true,
  }
  service { "ntpd":
    ensure    => running,
    enable    => true,
  }
}
