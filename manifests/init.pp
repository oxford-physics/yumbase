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
  $epel              = $yumbase::params::epel,
  $epelt             = $yumbase::params::epelt,
  $installonly_limit = $yumbase::params::installonly_limit,
  $debuglevel        = $yumbase::params::debuglevel,
  $tidyup            = $yumbase::params::tidyup  # Remove repos generated at install time
  ) inherits yumbase::params {
 
 tag("repo") 


 if ($facts['os']['family'] == 'RedHat') { 
   if ($facts['os']['release']['major'] == "6") {   
  
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
   }
 
   if ($facts['os']['release']['major'] == "7") {

     if $autoupdate == 'true' {
       augeas { "yum_autoupdate" :
       context  => "/files/etc/yum/yum-cron.conf",
       changes  =>  "set commands/apply_updates yes" ,
       }
     }
     else {
       augeas { "yum_autoupdate" :
       context  => "/files/etc/yum/yum-cron.conf",
       changes  =>  "set commands/apply_updates no" ,
      }
    }

   }

  if $os {
  notify { "my arch is ${facts['os']['release']['major']}":} 
   include yumbase::os
   if $tidyup {
     tidy { '/etc/yum.repos.d':
         matches => [ 'sl[6-7]*.repo', 'repos.repo', 'sl-extras.repo', 'redhat.repo'],
         recurse => 1,
     }
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

