class yumbase::puppet (
  
  $puppet             = $yumbase::params::puppet,
  $puppetpriority     = $yumbase::params::puppetpriority,
  $puppetrepobaseurl  = $yumbase::params::puppetrepobaseurl,
  $puppetreposerver   = $yumbase::params::puppetreposerver,
) inherits yumbase::params {
  
  yumbase::ai121yumrepo {
        'puppetlabs-product':
            descr    => "Puppet Labs Product EL ${operatingsystemmajrelease}  -\$basearch ",
            baseurl  => "http://${puppetreposerver}/${puppetrepobaseurl}/${operatingsystemmajrelease}/products/\$basearch",
            priority =>  "${puppetpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',            
            enabled =>  $puppet ? {
              true => "1",
              false => "0"
            };
         }   
   yumbase::ai121yumrepo {
        'puppetlabs-deps':
            descr    => "Puppet Labs Product EL ${operatingsystemmajrelease}  -\$basearch ",
            baseurl  => "http://${puppetreposerver}/${puppetrepobaseurl}/${operatingsystemmajrelease}/dependencies/\$basearch",
            priority =>  "${puppetpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',            
            enabled =>  $puppet ? {
              true => "1",
              false => "0"
            };
         }         
         
}
