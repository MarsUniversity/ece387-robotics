#!/bin/bash

set -e

# check if we are root
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit 1
fi

echo ""
echo "+-------------------------+"
echo "| Setting up Access Point |"
echo "+-------------------------+"
echo " WARNING: only run once!"
echo ""

# Since this appends things to files, I don't want to append the 
# same thing multiple times ... not sure what kind of software
# hell that would create!
if [[ -f "/etc/dnsmasq.conf" ]]; then
  echo ""
  echo " You have already run this ... do it by hand"
  echo ""
  return 1
fi

echo "<<< Updating and installing software >>>"

apt-get update
apt-get -y install dnsmasq hostapd
systemctl stop dnsmasq
systemctl stop hostapd

echo "<<< Setting up interfaces, moving current config file to *.orig >>>"

mv /etc/network/interfaces /etc/network/interfaces.orig

INTERFACE_CONFIG="                                     \n\
# Include files from /etc/network/interfaces.d:        \n\
source-directory /etc/network/interfaces.d             \n\
                                                       \n\
auto lo                                                \n\
iface lo inet loopback                                 \n\
                                                       \n\
iface eth0 inet manual                                 \n\
                                                       \n\
allow-hotplug wlan0                                    \n\
iface wlan0 inet manual                                \n\
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf   \n\
                                                       \n\    
allow-hotplug wlan1                                    \n\
iface wlan1 inet static                                \n\
  address 10.10.10.1                                   \n\
  netmask 255.255.255.0                                \n\
  network 10.10.10.0                                   \n"
  
echo -e > /etc/network/interfaces

echo "<<< Setting up DNSMASQ >>>"

# setup the dhcpd
# dhcp-range: start, end, mask, lease time
DNSMASQ="                                                \n\
interface=wlan1      # Use the usb wifi dongle           \n\
dhcp-range=10.10.10.5,10.10.10.100,255.255.255.0,24h     \n"

# backup the default one and write a new one
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig 
echo -e "${DNSMASQ}" > /etc/dnsmasq.conf

echo "<<< Setting up HOSTAPD >>>"

# the SSID for the access point will be the hostname
HOSTNAME=`uname -n`

echo "<<< SSID is: "${HOSTNAME}" >>>"

HOSTAPD="                      \n\
interface=wlan1                \n\
driver=nl80211                 \n\
ssid="${HOSTNAME}"             \n\
hw_mode=g                      \n\
channel=7                      \n\
wmm_enabled=0                  \n\
macaddr_acl=0                  \n\
auth_algs=1                    \n\
ignore_broadcast_ssid=0        \n\
wpa=2                          \n\
wpa_passphrase=robotsarecool   \n\
wpa_key_mgmt=WPA-PSK           \n\
wpa_pairwise=TKIP              \n\
rsn_pairwise=CCMP              \n"

# write config file
echo -e "${HOSTAPD}" > /etc/hostapd/hostapd.conf

# tell hostapd where the config file is, append (>>) this line to the end
echo -e "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\" \n" >> /etc/default/hostapd
