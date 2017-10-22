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
		ssid=<NameOfNetwork>
		channel=10
		auth_algs=1
		wpa=2
		wpa_passphrase=<password_atleast_8_characters>
		wpa_key_mgmt=WPA-PSK
		wpa_pairwise=CCMP
		rsn_pairwise=CCMP

1. Remove `/etc/init.d/hostapd` since it is unnecessary

1. Create `/etc/system.d/system/hostapd.service`:
    ```bash
        [Unit]
		Description=Hostapd Access Point
		After=sys-subsystem-net-devices-wlan1.device
		BindsTo=sys-subsystem-net-devices-wlan1.device

		[Service]
		Type=forking
		PIDFile=/var/run/hostapd.pid
		ExecStart=/usr/sbin/hostapd -B /etc/hostapd/hostapd.conf -P /var/run/hostapd.pid

		[Install]
		WantedBy=multi-user.target
    ```
	*Note:* if you are using an interface other than wlan1, make the correct
	change above.

1. Now do:

		sudo systemctl enable hostapd
		sudo systemctl start hostapd

1. Finally, double check all is well with `service hostapd status` which should show
  everything is up and running.

There should be a script `setup-access-point.sh` that will automate this for you.

# Login

Now you should be able to join your robot's wifi using the SSID and WPA passphrase.
Then login via `ssh`:

	ssh pi@<robot_name>.local
	ssh pi@10.10.10.1

**Note:** In order for your Windoze machine to be able to use *robot_name*.local,
you to install iTunes so Windoze can speak zeroconfig. I don't know of another
way to do this. If you don't want to do that, then just use the ip address of
10.10.10.1 which will work too.
