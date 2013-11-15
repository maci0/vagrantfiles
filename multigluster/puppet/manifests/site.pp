import "classes/*"

node default {
#  include ntp
#  include glusterfs
#  include firewalld
#  include avahi
  include zfs
}
