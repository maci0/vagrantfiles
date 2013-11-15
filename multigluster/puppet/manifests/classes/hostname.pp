class hostname {
 exec { "hostnameconfig":
    command => "/usr/bin/hostname > /etc/hostname",
  }
}
