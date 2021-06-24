#!/usr/bin/env bash

# copies lfi.php and lfi_script.sh to vm over ssh and runs lfi_script.sh

vboxmanage modifyvm ${VMNAME} --natpf1 "HTTP,tcp,,8800,,80"
vboxmanage startvm ${VMNAME} --type headless
echo "[*] waiting for vm to come up"
sleep 8 

scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/lfi_script.sh root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/index.php root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/contact.php root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/footer.php root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/menu.php root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/products.php root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/garden_index.jpg root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/flower1.jpg root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/flower2.jpg root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/flower3.jpg root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/flower4.jpg root@127.0.0.1:/root/
scp -P 2200 -i ${TMPDIR}/rootkey ${RESOURCEDIR}/stylesheet.css root@127.0.0.1:root/

ssh -p 2200 -i ${TMPDIR}/rootkey root@127.0.0.1 "bash /root/lfi_script.sh"
