class ntp {
  package { "ntp":
    ensure => installed,
  }

  service { "ntpdate":
    provider => systemd,
    enable    => true,
  }

  service { "ntpd":
    provider => systemd,
    ensure    => running,
    enable    => true,
  }
}
