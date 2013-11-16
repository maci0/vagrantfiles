class abrt {
  package { "abrt":
    ensure => installed,
  }
  service { "abrtd":
    ensure    => running,
    enable    => true,
    require => Package["abrt"],
  }
}
