---
title: Roomba's WiFi Access
author: Kevin J. Walchko
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
abstract: This will show you how to setup direct wifi access to the Roomba without having to worry about getting out of range of the D-Link access point.
---

# Roomba

Use [mote](https://github.com/MomsFriendlyRobotCompany/mote) for the initial setup. Then follow the instructions
here for more.

# Wifi and Access Point Setup

Setting up the RPi as an [access point](https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md#internet-sharing) so you can log directly into it without needing an access
point. We always had issues of the robots getting out of range of the base station,
this will solve that problem, because you can simply follow the robot around with
a laptop, iPad, or whatever logged in.

Although the RPi 3 has built in wifi, we are going to add another wifi to serve up
a local dhcp server on.

- wlan0: built in wifi
- wlan1: usb dongle added

1. Install packages:

		sudo apt-get install dnsmasq hostapd
		sudo systemctl stop dnsmasq
		sudo systemctl stop hostapd

1. Now add `denyinterfaces wlan1` to `/etc/dhcpcd.conf` so we don't self assign ip
   addresses to ourself on `wlan1`. However, it is okay if another dhcp server gives
   `wlan0` an ip address.

1. Edit `/etc/network/interfaces` so our `wlan1` interface has a static ip address:

		allow-hotplug wlan1  
		iface wlan1 inet static  
		    address 10.10.10.1
		    netmask 255.255.255.0
		    network 10.10.10.0

1. Setup dnsmasq

		sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
		sudo nano /etc/dnsmasq.conf

   Then add the following lines which say which interface to use and min ip address, max ip address, mask, and how long it is valid for:

   		interface=wlan1      # Use the usb wifi dongle
		dhcp-range=10.10.10.5,10.10.10.100,255.255.255.0,24h

1. Setup hostapd config file: `/etc/hostapd/hostapd.conf`:

		interface=wlan1
		driver=nl80211
		ssid=<NameOfNetwork>
		hw_mode=g
		channel=7
		wmm_enabled=0
		macaddr_acl=0
		auth_algs=1
		ignore_broadcast_ssid=0
		wpa=2
		wpa_passphrase=<password_atleast_8_characters>
		wpa_key_mgmt=WPA-PSK
		wpa_pairwise=TKIP
		rsn_pairwise=CCMP

1. In `/etc/default/hostapd`, add `DAEMON_CONF="/etc/hostapd/hostapd.conf"`

1. Now reboot with: `sudo reboot now`. Everything should come up working automatically.

There should be a script `setup-access-point.sh` that will automate this for you.

# Login

	ssh pi@<robot_name>.local

# See Sensors

The create has been augmented with an inertial measurement unit.

	pi@create rambler $ sudo i2cdetect -y 1
	     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
	00:          -- -- -- -- -- -- -- -- -- -- -- -- --
	10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 1f
	20: -- 21 -- -- -- -- -- -- -- -- -- -- -- -- -- --
	30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	70: -- -- -- -- -- -- -- --

# Test

TBD
