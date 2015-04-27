class yumbase::epeltesting (  
  
  $epeltreposerver   = $yumbase::params::epeltreposerver,
  $epeltrepobaseurl  = $yumbase::params::epeltrepobaseurl,
  $epelt            = $yumbase::params::epelt,
  $epeltpriority    = $yumbase::params::epeltpriority,
  
  
  )inherits yumbase::params {
    
  yumbase::ai121yumrepo {
        'epeltesting':
            descr    => "Epel testing  ${operatingsystemmajrelease}  - ${architecture}",
            baseurl  => "http://${epeltreposerver}/${epeltrepobaseurl}/${operatingsystemmajrelease}/${architecture}",
            priority =>  "${epelpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',
            enabled =>  $epelt ? {
              true => "1",
              false => "0"
            };
         }
}
