define  yumbase::ai121yumrepo ($enabled,$baseurl,$descr,$includepkgs='absent',$protect='0',$gpgcheck='1',$gpgkey='absent',$priority='99') {

$filename = $title

yumrepo{$filename:
   descr        => $descr,
   enabled      => $enabled,
   baseurl      => $baseurl,
   protect      => $protect,
   includepkgs  => $includepkgs,
   gpgcheck     => $gpgcheck,
   gpgkey       => $gpgkey,
   priority     => $priority,
   require      => [ File ["/etc/yum.repos.d/${filename}.repo"]],

 }
 file {"/etc/yum.repos.d/${filename}.repo":
     ensure  => present,
     owner   => 'root',
     group   => 'root',
     mode    => '0644',
#     require => [Yumrepo[$title]]
 }
}

