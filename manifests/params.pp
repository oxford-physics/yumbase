class yumbase::params(
  $autoupdate       =  false,
  
  $slrepobaseurl    = 'linux/scientific',
  $slreposerver     = 'ftp.scientificlinux.org',
  $sl               =  true,
  $slpriority       =  '5',
  
  $slsec            =  true,  
  $slsecrepobaseurl =  'linux/scientific',
  $slsecreposerver  = 'ftp.scientificlinux.org',  
  $slsecpriority    = '5',
  
  $epel             =  true,
  $epelrepobaseurl  =  'pub/epel/testing',
  $epelreposerver   =  'download.fedoraproject.org',
  $epelpriority     = '20',
  
  $epelt            =  false,
  $epeltrepobaseurl =  'pub/epel',
  $epeltreposerver  = 'download.fedoraproject.org',  
  $epeltpriority    =  '20', 
  
  $puppet            =  true,
  $puppetrepobaseurl =  'el',
  $puppetreposerver  = 'yum.puppetlabs.com',  
  $puppetpriority    =  '15',
  )
{ }
