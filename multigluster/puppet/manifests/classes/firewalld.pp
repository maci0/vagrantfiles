class firewalld {
  service { "firewalld":
    provider => systemd,
    ensure    => stopped,
    enable    => false,
  }
}
