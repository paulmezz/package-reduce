#!/bin/bash 

echo "Generating list"
yum list installed | grep -v "Installed Packages" | cut -f 1 -d " " | cut -f 1 -d . | grep '^[a-zA-Z]\|[0-9]' | sort | uniq > /tmp/installed.list
#list packages, remove header, remove versions etc, remove arch, remove any empty spaces etc, sort it, remove dupes

cp /tmp/installed.list installed.trimmed
cat /tmp/installed.list | while read PACKAGE ; do
	echo -n "${PACKAGE} :" 
	yum deplist $PACKAGE | grep provider: | cut -f 2 -d : | cut -f 1 -d . | sort | uniq | cut -b 2- | while read DEPENDENCY ; do
			echo -n " ${DEPENDENCY}"
			sed -i "/^${DEPENDENCY}\$/d" installed.trimmed
	done
	echo " "
done
-
