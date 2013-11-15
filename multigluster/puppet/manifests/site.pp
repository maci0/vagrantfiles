import "classes/*"

node default {
  include hostname
  include selinux
  include ntp
  include glusterfs
  include firewall
  include avahi
  include zfs
}
