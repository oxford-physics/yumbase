class yumbase::virtual (
  
  $vmware             = $yumbase::params::vmware,
  $vmwarepriority     = $yumbase::params::vmwarepriority,
  $vmwarerepobaseurl  = $yumbase::params::vmwarerepobaseurl,
  $vmwarereposerver   = $yumbase::params::vmwarereposerver,

) inherits yumbase::params {


 if  str2bool("$is_virtual") { 


  if ( $::virtual == 'vmware') {
#Key should be  http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub  
  yumbase::ai121yumrepo {
        'vmware-tools':
            descr    => "VMware Tools for CentOS (or OEL) ${operatingsystemmajrelease}  -\$basearch ",
            baseurl  => "http://${vmwarereposerver}/${vmwarerepobaseurl}/rhel${operatingsystemmajrelease}/\$basearch",
            priority =>  "${vmwarepriority}",
            gpgcheck => "0",
            gpgkey   =>  'absent',            
            enabled =>  true
         }   
   }#vmware


  }#virtual


}
