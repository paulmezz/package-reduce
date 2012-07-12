#!/bin/bash 

echo "Generating list"
yum list installed | grep -v "Installed Packages" | cut -f 1 -d " " | cut -f 1 -d . | grep '^[a-zA-Z]\|[0-9]' | sort | uniq > /tmp/installed.list
#list packages, remove header, remove versions etc, remove arch, remove any empty spaces etc, sort it, remove dupes

cp installed.trimmed installed.reduced
cat /tmp/installed.list | while read PACKAGE ; do
	echo removing ${PACKAGE}
	sed -i "/^${PACKAGE}\$/d" /tmp/installed.reduced
done
-
