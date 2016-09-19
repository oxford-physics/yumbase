class yumbase::puppet (
  
  $puppet             = $yumbase::params::puppet,
  $puppetpriority     = $yumbase::params::puppetpriority,
  $puppetrepobaseurl  = $yumbase::params::puppetrepobaseurl,
  $puppetreposerver   = $yumbase::params::puppetreposerver,
) inherits yumbase::params {
  
  yumrepo {
        'puppetlabs-product':
            descr    => "Puppet Labs Product EL $facts['os']['release']['major']  -\$basearch ",
            baseurl  => "http://${puppetreposerver}/${puppetrepobaseurl}/$facts['os']['release']['major']/products/\$basearch",
            priority =>  "${puppetpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',            
            enabled =>  $puppet ? {
              true => "1",
              false => "0"
            };
         }   
   yumrepo {
        'puppetlabs-deps':
            descr    => "Puppet Labs Product EL $facts['os']['release']['major']  -\$basearch ",
            baseurl  => "http://${puppetreposerver}/${puppetrepobaseurl}/$facts['os']['release']['major']/dependencies/\$basearch",
            priority =>  "${puppetpriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',            
            enabled =>  $puppet ? {
              true => "1",
              false => "0"
            };
         }         
         
}
