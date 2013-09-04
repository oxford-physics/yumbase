class yumbase::epel (
  
  $epel             = $yumbase::params::epel,
  $epelpriority     = $yumbase::params::epelpriority,
  $epelrepobaseurl  = $yumbase::params::epelrepobaseurl,
  $epelreposerver   = $yumbase::params::epelreposerver,
) inherits yumbase::params {
  
  yumbase::ai121yumrepo {
        'epel':
            descr    => "Epel ${operatingsystemmajrelease}  - ${architecture}",
            baseurl  => "http://${epelreposerver}/${epelrepobaseurl}/${operatingsystemmajrelease}/${architecture}",
            priority =>  "${epelpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',            
            enabled =>  $epel ? {
              true => "1",
              false => "0"
            };
         }   
}