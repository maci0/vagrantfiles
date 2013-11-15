class zfs {
  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux":
    owner => root, group => root, mode => 0444,
    ensure => present,
    source => "/vagrant/puppet/files/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux";
  }
  
  file {"/etc/yum.repos.d/zfs.repo":
    ensure => present,
    source => "/vagrant/puppet/files/etc/yum.repos.d/zfs.repo";
  }

  package { "zfs":
    require => [ File['/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux'], File['/etc/yum.repos.d/zfs.repo'] ],
    ensure => installed,
  }

  service { "zfs":
    ensure    => running,
    enable    => true,
    require => Package['zfs'],
  }
  
  exec { "create_sdb_sdc_img":
    command => "/bin/truncate -s 500G /sdb.img /sdc.img",
  }
  
}
