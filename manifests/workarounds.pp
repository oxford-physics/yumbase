#do not add me to git
class yumbase::workarounds()
{
$filename="/usr/share/augeas/lenses/yumautoupdate.aug"
file { "$filename"  : 
      ensure => absent,
     }
}
