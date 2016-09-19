class yumbase::epeltesting (  
  
  $epeltreposerver   = $yumbase::params::epeltreposerver,
  $epeltrepobaseurl  = $yumbase::params::epeltrepobaseurl,
  $epelt            = $yumbase::params::epelt,
  $epeltpriority    = $yumbase::params::epeltpriority,
  
  
  )inherits yumbase::params {
    
  yumrepo {
        'epeltesting':
            descr    => "Epel testing  $facts['os']['release']['major']  - $facts['os']['architecture']",
            baseurl  => "http://${epeltreposerver}/${epeltrepobaseurl}/$facts['os']['release']['major']/$facts['os']['architecture']",
            priority =>  "${epelpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $epelt ? {
              true => "1",
              false => "0"
            };
         }
}
