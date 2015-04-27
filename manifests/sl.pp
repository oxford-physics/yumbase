class yumbase::sl (
  $sl               = $yumbase::params::sl,
  $slpriority       = $yumbase::params::slpriority,
  $slsec            = $yumbase::params::slsec,
  $slsecpriority    = $yumbase::params::slsecpriority,
  $sldebug               = $yumbase::params::sldebug,
  $sldebugpriority       = $yumbase::params::sldebugpriority,
  $slreposerver     = $yumbase::params::slreposerver, 
  $slrepobaseurl    = $yumbase::params::slrepobaseurl,
  $slsecreposerver  = $yumbase::params::slsecreposerver,
  $slsecrepobaseurl  = $yumbase::params::slsecrepobaseurl,
  $sldebugreposerver  = $yumbase::params::sldebugreposerver,
  $sldebugrepobaseurl  = $yumbase::params::sldebugrepobaseurl,
  
) inherits yumbase::params {
  
  yumbase::ai121yumrepo {
        'sl':
            descr    => "Base Enterprise Linux ${operatingsystem}  - ${architecture}",
            baseurl  => "http://${slreposerver}/${$slrepobaseurl}/${operatingsystemmajrelease}/${architecture}/os",
            priority =>  "${slpriority}",
            gpgcheck => '0',
            gpgkey   =>  'absent',            
            enabled =>  $sl ? {
              true => "1",
              false => "0"
            };
            
        }

 yumbase::ai121yumrepo {
        'sl-security':
            descr    => "Base Enterprise Linux Security ${operatingsystem}  - ${architecture}",
            baseurl  => "http://${slsecreposerver}/${slsecrepobaseurl}/${operatingsystemmajrelease}/${architecture}/updates/security",
            priority =>  "${slsecpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $slsec ? {
              true => "1",
              false => "0"
            };     
       }
 yumbase::ai121yumrepo {
        'sl-debug':
            descr    => "Base Enterprise Linux debuginfo ${operatingsystem}  - ${architecture}",
            baseurl  => "http://${sldebugreposerver}/${sldebugrepobaseurl}/debuginfo",
            priority =>  "${slsecpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $sldebug ? {
              true => "1",
              false => "0"
            };     
       }
  
}
