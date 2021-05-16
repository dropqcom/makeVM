#!/usr/bin/env bash

# copies lfi.php and lfi_script.sh to vm over ssh and runs lfi_script.sh

vboxmanage startvm ${VMNAME} --type headless
echo "[*] waiting for vm to come up"
sleep 8 

scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/lfi.php root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/lfi_script.sh root@127.0.0.1:/root/
ssh -p 2200 -i ${TMPDIR}/rootkey root@127.0.0.1 "bash /root/lfi_script.sh"
