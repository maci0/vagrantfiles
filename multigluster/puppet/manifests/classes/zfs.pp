class zfs {
#  package { "kernel":
#    ensure => latest,
#  }
  package { "zfs":
#    require => [ Exec['zfsreleaserpm'], Package['kernel'] ],
    require => Exec['zfsreleaserpm'],
    ensure => installed,
  }
  service { "zfs":
    ensure    => running,
    enable    => true,
    require => Package['zfs'],
  }
  service { "dkms":
    ensure    => running,
    require => Package['zfs'],
  }
  service { "dkms_autoinstaller":
    enable    => true,
    require => Package['zfs'],
  }
  exec { 'zfsreleaserpm':
    name => $operatingsystem ? {
      Fedora => "/bin/yum -y localinstall --nogpgcheck http://archive.zfsonlinux.org/fedora/zfs-release-1-2$(rpm -E %dist).noarch.rpm",
      CentOS => "/bin/yum -y localinstall --nogpgcheck http://archive.zfsonlinux.org/epel/zfs-release-1-3$(rpm -E %dist).noarch.rpm",
    }
   }
}
