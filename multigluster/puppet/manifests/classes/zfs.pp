#print $operatingsystemrelease
class zfs {
  package { "zfs":
    ensure => installed,
  }
  package { "zfs-release":
    provider => yum,
    ensure => installed,
    source => "http://archive.zfsonlinux.org/fedora/zfs-release-1-2.fc19.noarch.rpm",
 #   before => "zfs",
  }
  service { "zfs":
    ensure    => running,
    enable    => true,
  }
}
