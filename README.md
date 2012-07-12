package-reduce
==============

Pulls the list of installed packages from yum and reduces it down to the 
smallest list possible (aka remove deps)

This is VERY rough code at the moment.  Most of the time is waiting for yum
to generate dep lists.  

On the source machine, run package-reduce.sh.  This will generate the 
smallest list of packages possible for the source machine.  It WILL include 
system packages.  You will get a file "installed.trimmed".

On the destination machine, copy the installed.trimmed over and run 
package-duperemover.sh.  If the packages are installed local, they will be 
removed from the list.  (Not technically needed as yum will ignore already
installed packages.
