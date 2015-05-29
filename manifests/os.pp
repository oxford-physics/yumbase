class yumbase::os (
  $os               = $yumbase::params::os,
  $ospriority       = $yumbase::params::ospriority,
  $ossec            = $yumbase::params::ossec,
  $ossecpriority    = $yumbase::params::ossecpriority,
  $osdebug               = $yumbase::params::osdebug,
  $osdebugpriority       = $yumbase::params::osdebugpriority,
  $osreposerver     = $yumbase::params::osreposerver, 
  $osrepobaseurl    = $yumbase::params::osrepobaseurl,
  $ossecreposerver  = $yumbase::params::ossecreposerver,
  $ossecrepobaseurl  = $yumbase::params::ossecrepobaseurl,
  $osdebugreposerver  = $yumbase::params::osdebugreposerver,
  $osdebugrepobaseurl  = $yumbase::params::osdebugrepobaseurl,
  
) inherits yumbase::params {
  
         case $::operatingsystem {

  /CentOS/: {
            $osbaseurl  = "http://${osreposerver}/${$osrepobaseurl}/${operatingsystemmajrelease}/os/${architecture}"
            $secbaseurl  = "http://${ossecreposerver}/${$ossecrepobaseurl}/${operatingsystemmajrelease}/updates/${architecture}"
            $debugbaseurl  = "http://${osdebugreposerver}/${$osdebugrepobaseurl}/${operatingsystemmajrelease}/${architecture}"
            }
  default: {
            $osbaseurl  = "http://${osreposerver}/${$osrepobaseurl}/${operatingsystemmajrelease}/${architecture}/os"
            $secbaseurl  = "http://${ossecreposerver}/${ossecrepobaseurl}/${operatingsystemmajrelease}/${architecture}/updates/security"
            $debugbaseurl  = "http://${osdebugreposerver}/${osdebugrepobaseurl}/debuginfo"
           }
}


  yumbase::ai121yumrepo {
        'os':
            descr    => "Base Enterprise Linux ${operatingsystem}  - ${architecture}",
            baseurl => "${osbaseurl}",
            priority =>  "${ospriority}",
            gpgcheck => '0',
            gpgkey   =>  'absent',            
            enabled =>  $os ? {
              true => "1",
              false => "0"
            };
            
        }

 yumbase::ai121yumrepo {
        'os-security':
            descr    => "Base Enterprise Linux Security ${operatingsystem}  - ${architecture}",
            baseurl => "${secbaseurl}",
            priority =>  "${ossecpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $ossec ? {
              true => "1",
              false => "0"
            };     
       }
 yumbase::ai121yumrepo {
        'os-debug':
            descr    => "Base Enterprise Linux debuginfo ${operatingsystem}  - ${architecture}",
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
