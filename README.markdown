# yumbase #

his is the yumbase module. It setup repos for SL and epel. Autoupdate for SL6 can be enabled/disabled by changing autoupdate.

ai121yumrepo define function is used as workaround propesed by Steve Traylen for bug http://projects.puppetlabs.com/issues/9293 

Unused yum repo is removed from yum.repos.d

'include yumbase' will setup all repos depending on values passed from Hiera. Seperate repos can also be called.

