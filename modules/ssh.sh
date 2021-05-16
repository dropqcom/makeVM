#!/usr/bin/env bash

# . ${ENVFILE} 2>/dev/null

# configure network (using nat)
vboxmanage modifyvm ${VMNAME} --natpf1 "SSH,tcp,,2200,,22"
# start vm 
vboxmanage startvm ${VMNAME} --type headless
echo "[*] Waiting for vm to start up..."
sleep 10

# delete old keys and create new one for mario 
rm -f ${TMPDIR}/mariokey*
ssh-keygen -b 2048 -t rsa -f ${TMPDIR}/mariokey -q -N ""

# ssh-copy-id installs ssh key on this vm as an authorized key
sshpass -p Its4321?! ssh-copy-id -i ${TMPDIR}/mariokey.pub -p 2200 mario@127.0.0.1

chmod 700 ${TMPDIR}/mariokey*

ssh -p 2200 -i ${TMPDIR}/mariokey mario@127.0.0.1 "ls"

# same for root
rm -f ${TMPDIR}/rootkey*
ssh-keygen -b 2048 -t rsa -f ${TMPDIR}/rootkey -q -N ""
sshpass -p Its4321?! ssh-copy-id -i ${TMPDIR}/rootkey.pub -p 2200 mario@127.0.0.1
chmod 700 ${TMPDIR}/rootkey*
ssh -p 2200 -i ${TMPDIR}/rootkey root@127.0.0.1 "ls"

