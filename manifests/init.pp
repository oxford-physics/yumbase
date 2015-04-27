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
  $autoupdate        = $yumbase::params::autoupdate,
  $sl                = $yumbase::params::sl,
  $epel              = $yumbase::params::epel,
  $epelt             = $yumbase::params::epelt,
  $installonly_limit = $yumbase::params::installonly_limit,
  $debuglevel        = $yumbase::params::debuglevel,
  ) inherits yumbase::params {
 
 tag("repo") 


 if $::osfamily == 'RedHat' { 
   
  
  if $autoupdate == 'true' {
  augeas { "yum_autoupdate" :
      context  => "/files/etc/sysconfig/yum-autoupdate",
      changes  =>  "set ENABLED '\"$autoupdate\"'" ,
    }
  }  
  else {
  augeas { "yum_autoupdate" :
      context  => "/files/etc/sysconfig/yum-autoupdate",
      changes  =>  "set ENABLED '\"$autoupdate\"'" ,
    }
  }
  
file { "/etc/yum.conf":
    ensure => present,
    mode   => 0644,
    owner  => root,
    group  => root,
    content=> template("yumbase/yum.conf.el6"),
}

file { "/etc/yum.repos.d":
    ensure => directory,
    recurse => true,
    purge => "$auto_perge",
    ignore => "$ignore_auto_perge",
 }

###TODO: replace SL part entirely with 'os' to cope with Centos in a sensible way
case $operatingsystem {
             /Scientific/:  {
 if $sl {
   include yumbase::sl
 }
}
  
          /CentOS/:  {
    include yumbase::os
 } 
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

