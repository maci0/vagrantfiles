class firewall {
  service { "firewalld":
    ensure    => stopped,
    enable    => false,
  }
  service { "iptables":
    ensure    => stopped,
    enable    => false,
  }
}
