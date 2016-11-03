class yumbase::params(
  $autoupdate        =  'false',
  $auto_perge        =  'true',
  $ignore_auto_perge = '',
  $installonly_limit = 3,
  $debuglevel = 2,
  $tidyup            = 'true',

  $os                =  true,
  $ospriority        =  '5',

  $ossec             = true,
  $ossecpriority     = '5',

  $osdebug             =  false,
  $osdebugpriority     = '5',

  $epel              =  false,
  $epelrepobaseurl   =  'pub/epel',
  $epelreposerver    =  'download.fedoraproject.org',
  $epelpriority      = '20',
  $epelexclude       = 'absent',
  
  $epelt             =  false,
  $epeltrepobaseurl  =  'pub/epel/testing',
  $epeltreposerver   = 'download.fedoraproject.org',  
  $epeltpriority     =  '20', 
  
  $puppet            =  false,
  $puppetrepobaseurl =  'el',
  $puppetreposerver  = 'yum.puppetlabs.com',  
  $puppetpriority    =  '15',
  
  $vmware            = 'vmware',
  $vmwarepriority    = '15',
  $vmwarereposerver  = 'packages.vmware.com'
  )

{
  
  case $facts['os']['name'] {

     default: {}
     /CentOS/,  /Scientific/: {
        case $facts['os']['release']['major'] { 
           /6/: {
               $vmwarerepobaseurl = hiera("yumbase::params::vmwarerepobaseurl", 'tools/esx/latest')
           }
           /7/: { 
               $vmwarerepobaseurl = hiera("yumbase::params::vmwarerepobaseurl", 'packages')
           }
        }
    } 
  }
  
  case $facts['os']['name'] {

  default: {}
  /CentOS/: {

  $osrepobaseurlin     = 'centos'
  $osreposerverin      = 'mirror.centos.org'
 
  $ossecrepobaseurlin  =  'centos'
  $ossecreposerverin   = 'mirror.centos.org'

  $osdebugrepobaseurlin  =  'centos'
  $osdebugreposerverin   = 'mirror.centos.org'
  }

  /Scientific/: {

  $osrepobaseurlin     = 'linux/scientific'
  $osreposerverin      = 'ftp.scientificlinux.org'
  
  $ossecrepobaseurlin  =  'linux/scientific'
  $ossecreposerverin   = 'ftp.scientificlinux.org'

  $osdebugrepobaseurlin  =  "linux/scientific/${facts['os']['release']['full']}/archive"
  $osdebugreposerverin   = 'ftp.scientificlinux.org'

  }

  }
  $osrepobaseurl = hiera('yumbase::params::osrepobaseurl',             "$osrepobaseurlin")
  $osreposerver = hiera('yumbase::params::osreposerver',               "$osreposerverin")
  $ossecreposerver = hiera('yumbase::params::ossecreposerver',         "$ossecreposerverin")
  $ossecrepobaseurl = hiera('yumbase::params::ossecrepobaseurl'       ,"$ossecrepobaseurlin")
  $osdebugreposerver = hiera('yumbase::params::osdebugreposerverrepo' ,"$osdebugreposerverin")
  $osdebugrepobaseurl = hiera('yumbase::params::osdebugrepobaseurl'   ,"$osdebugrepobaseurlin")
}

