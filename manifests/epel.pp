class yumbase::epel (
  
  $epel             = $yumbase::params::epel,
  $epelpriority     = $yumbase::params::epelpriority,
  $epelrepobaseurl  = $yumbase::params::epelrepobaseurl,
  $epelreposerver   = $yumbase::params::epelreposerver,
  $epelexclude      = $yumbase::params::epelexclude,
) inherits yumbase::params {
  
  yumrepo {
        'epel':
            descr    => "Epel ${facts['os']['release']['major']}  - ${facts['os']['architecture']}",
            baseurl  => "http://${epelreposerver}/${epelrepobaseurl}/${facts['os']['release']['major']}/${facts['os']['architecture']}",
            priority =>  "${epelpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            exclude  =>  "${epelexclude}",             
            enabled =>  $epel ? {
              true => "1",
              false => "0"
            };
         }   
}
