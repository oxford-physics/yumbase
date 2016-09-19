class yumbase::os (
  $os                  = $yumbase::params::os,
  $ospriority          = $yumbase::params::ospriority,
  $ossec               = $yumbase::params::ossec,
  $ossecpriority       = $yumbase::params::ossecpriority,
  $osdebug             = $yumbase::params::osdebug,
  $osdebugpriority     = $yumbase::params::osdebugpriority,
  $osreposerver        = $yumbase::params::osreposerver, 
  $osrepobaseurl       = $yumbase::params::osrepobaseurl,
  $ossecreposerver     = $yumbase::params::ossecreposerver,
  $ossecrepobaseurl    = $yumbase::params::ossecrepobaseurl,
  $osdebugreposerver   = $yumbase::params::osdebugreposerver,
  $osdebugrepobaseurl  = $yumbase::params::osdebugrepobaseurl,
  
) inherits yumbase::params {
  
         case $facts['os']['name'] {

  /CentOS/: {
            $osbaseurl  = "http://${osreposerver}/${$osrepobaseurl}/$facts{['os']['release']['major']/os/$facts['os']['architecture']}"
            $secbaseurl  = "http://${ossecreposerver}/${$ossecrepobaseurl}/$facts{['os']['release']['major']}/updates/$facts{['os']['architecture']}"
            $debugbaseurl  = "http://${osdebugreposerver}/${$osdebugrepobaseurl}/${facts['os']['release']['major']}/${facts['os']['architecture']}"
            }
  default: {
            $osbaseurl  = "http://${osreposerver}/${$osrepobaseurl}/${facts['os']['release']['major']}/${facts['os']['architecture']}/os"
            $secbaseurl  = "http://${ossecreposerver}/${ossecrepobaseurl}/${facts['os']['release']['major']}/${facts['os']['architecture']}/updates/security"
            $debugbaseurl  = "http://${osdebugreposerver}/${osdebugrepobaseurl}/debuginfo"
           }
}


    yumrepo {
        'os':
            descr    => "Base Enterprise Linux ${facts['os']['name']}  - ${facts['os']['architecture']}",
            baseurl => "${osbaseurl}",
            priority =>  "${ospriority}",
            gpgcheck => '0',
            gpgkey   =>  'absent',            
            enabled =>  $os ? {
              true => "1",
              false => "0"
            };
            
        }

   yumrepo {
        'os-security':
            descr    => "Base Enterprise Linux Security ${facts['os']['name']}  - ${facts['os']['architecture']}",
            baseurl => "${secbaseurl}",
            priority =>  "${ossecpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $ossec ? {
              true => "1",
              false => "0"
            };     
       }
    yumrepo {
        'os-debug':
            descr    => "Base Enterprise Linux debuginfo ${facts['os']['name']}  - ${facts['os']['architecture']}",
            baseurl =>  "${debugbaseurl}",
            priority =>  "${osdebugpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $osdebug ? {
              true => "1",
              false => "0"
            };     
       }
  
}
