class yumbase::params(
  $autoupdate        =  'false',
  $auto_perge        =  'true',
  $ignore_auto_perge = '',
  $installonly_limit = 3,
  $debuglevel = 2,

  $slrepobaseurl     = 'linux/scientific',
  $slreposerver      = 'ftp.scientificlinux.org',
  $sl                =  true,
  $slpriority        =  '5',
  
  $slsec             =  true,  
  $slsecrepobaseurl  =  'linux/scientific',
  $slsecreposerver   = 'ftp.scientificlinux.org',  
  $slsecpriority     = '5',

  $sldebug             =  false,  
  $sldebugrepobaseurl  =  'linux/scientific/6.5/archive',
  $sldebugreposerver   = 'ftp.scientificlinux.org',  
  $sldebugpriority     = '5',

  $epel              =  true,
  $epelrepobaseurl   =  'pub/epel/testing',
  $epelreposerver    =  'download.fedoraproject.org',
  $epelpriority      = '20',
  $epelexclude       = 'absent',
  
  $epelt             =  false,
  $epeltrepobaseurl  =  'pub/epel',
  $epeltreposerver   = 'download.fedoraproject.org',  
  $epeltpriority     =  '20', 
  
  $puppet            =  true,
  $puppetrepobaseurl =  'el',
  $puppetreposerver  = 'yum.puppetlabs.com',  
  $puppetpriority    =  '15',
  
  $vmware            = 'vmware',
  $vmwarepriority    = '15',
  $vmwarerepobaseurl = 'tools/esx/latest',
  $vmwarereposerver  = 'packages.vmware.com'


  )

{

  case $::operatingsystem {

  default: {}
  /CentOS/: {

  $osrepobaseurl     = 'centos'
  $osreposerver      = 'mirror.centos.org'
  $os                =  true
  $ospriority        =  '5'
  
  $ossec             =  true
  $ossecrepobaseurl  =  'centos'
  $ossecreposerver   = 'mirror.centos.org'
  $ossecpriority     = '5'

  $osdebug             =  false
  $osdebugrepobaseurl  =  'centos'
  $osdebugreposerver   = 'mirror.centos.org'
  $osdebugpriority     = '5'
  }

  /Scientific/: {

  $osrepobaseurl     = 'linux/scientific'
  $osreposerver      = 'ftp.scientificlinux.org'
  $os                =  false
  $ospriority        =  '5'
  
  $ossec             =  false
  $ossecrepobaseurl  =  'linux/scientific'
  $ossecreposerver   = 'ftp.scientificlinux.org'
  $ossecpriority     = '5'

  $osdebug             =  false
  $osdebugrepobaseurl  =  'linux/scientific/6.5/archive'
  $osdebugreposerver   = 'ftp.scientificlinux.org'
  $osdebugpriority     = '5'
  }
  }
}

