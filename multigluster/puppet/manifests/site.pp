import "classes/*"

node default {
  include ntp
  include glusterfs
  include firewalld
#  include zfs
}
