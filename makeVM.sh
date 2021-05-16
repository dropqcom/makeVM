#!/bin/bash

export TMPDIR=temp
export VMNAME="HTW-Injectable-Test"
export STARTSNAPSHOT="CleanInstallTest"
export RESOURCEDIR=modules/ressources

# restore cleaninstall an poweroff vm
vboxmanage controlvm ${VMNAME} poweroff
vboxmanage snapshot ${VMNANE} restore ${STARTSNAPSHOT}
vboxmanage controlvm ${VMNAME} acpipowerbutton
sleep 5

# install modules
for module in `cat modules.txt | grep -v "#"`; do 
	echo "[==>] Running module ${module}..."
	modules/${module}
	sleep 10
	vboxmanage controlvm ${VMNAME} acpipowerbutton
	sleep 10
	vboxmanage controlvm ${VMNAME} poweroff
	sleep 2
done


