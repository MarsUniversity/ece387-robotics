#!/bin/bash


mkdir -p /media/usb
chown -R pi /media/usb
chmod -R 0777 /media/usb

cat <<EOF >>/etc/fstab

/dev/sda1 /media/usb auto user,umask=000,utf8,noauto 0 0
EOF
