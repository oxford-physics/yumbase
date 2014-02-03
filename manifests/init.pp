# Class: yumbase
#
# This module manages yum-base
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class yumbase (
  $autoupdate       = $yumbase::params::autoupdate,
  $sl               = $yumbase::params::sl,
  $epel             = $yumbase::params::epel,
  $epelt            = $yumbase::params::epelt,
  ) inherits yumbase::params {
 
 tag("repo") 

# file { '/etc/sysconfig/yum-autoupdate' : 
#       ensure => present,
#       owner   => 'root',
#       group   => 'root',
# }      

 if $::osfamily == 'RedHat' { 
   
  
  if $autoupdate == 'true' {
  augeas { "yum_autoupdate" :
      #load_path => "/usr/share/augeas/lenses/",
      #lens => "yumautoupdate.aug",
      context  => "/files/etc/sysconfig/yum-autoupdate",
      changes  =>  "set ENABLED '\"$autoupdate\"'" ,
    }
  }  
  else {
  augeas { "yum_autoupdate" :
      context  => "/files/etc/sysconfig/yum-autoupdate",
      changes  =>  "set ENABLED '\"$autoupdate\"'" ,
    }
   include yumbase::workarounds
  }
  
file { "/etc/yum.repos.d":
    ensure => directory,
    recurse => true,
    purge => true,
    ignore => "$ignore_auto_perge",
 }

if $sl {
  include yumbase::sl
}

if $epel {
  include yumbase::epel
}

if $epelt {
  include yumbase::epeltesting
}

if $puppet {
  include yumbase::puppet
}
 
} else { 
 notice (" yumbase will not be setup on this operating system")
 }
}

