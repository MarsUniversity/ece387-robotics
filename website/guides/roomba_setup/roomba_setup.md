---
title: Setup Roomba's Software
author: Kevin J. Walchko
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
abstract: This will show you how to setup the Roomba.
---

# Software Setup

## Mote

These scripts are to help setup a new Raspbian system. Once you `ssh` in, update the system:

    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y install git

Get a copy of this software one of two ways:

    mkdir github
    cd github
    git clone https://github.com/MomsFriendlyRobotCompany/mote.git # if you don't have write access to my repo
    git clone git@github.com:MomsFriendlyRobotCompany/mote.git     # if you are me

Now go into the software directory and install/setup everything:

    sudo ./install.sh
    sudo ./setup.sh <hostname> <wifi-ssid> <wifi-password>
    sudo ./setup-smb.sh  # you will be asked for a SMB password, just use raspberry
    ./setup-git.sh <github-username>
    ./setup-ssh.sh


## Roomba Software

Now use the software here to install stuff:

    pip install -U -r roomba.txt
    sudo ./setup-access-point.sh

## OpenCV

    git clone https://github.com/MomsFriendlyRobotCompany/raspbian_pkgs.git
    cd raspbian_pkgs/opencv
    sudo ./update-opencv.sh
    dpkg -i libopencv3-kevin.deb


# Issues

## Fix python path

### Python 2.7

    pi@mario software $ cat /etc/python2.7/sitecustomize.py
	# install the apport exception handler if available
	import sys, os
	my_site = os.path.join(
		os.environ['HOME'],
		'/usr/local/lib/python2.7/dist-packages'
	)
	sys.path.insert(0, my_site)

    try:
		import apport_python_hook
	except ImportError:
		pass
	else:
		apport_python_hook.install()

### Python3.5

    pi@mario software $ cat /etc/python3.5/sitecustomize.py
	# install the apport exception handler if available
	import sys, os
	my_site = os.path.join(
		os.environ['HOME'],
		'/usr/local/lib/python3/dist-packages'
	)
	sys.path.insert(0, my_site)

    try:
		import apport_python_hook
	except ImportError:
		pass
	else:
		apport_python_hook.install()

## Static IP Address

I don't think you need to do this ... students connect to RPI access point SSID and 
connect to pi@10.10.10.1. They don't need anything else.

https://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip-address

https://medium.com/@cpt_midnight/static-ip-in-debian-9-stretch-acb4e5cb7dc1

`/etc/network/interfaces`

from:

```bash
# The primary network interface
allow-hotplug eth0
iface eth0 inet dhcp
```

To:

```bash
# The primary network interface
allow-hotplug eth0
iface eth0 inet static
        address 192.168.1.202
        netmask 255.255.255.0
        gateway 192.0.1.1
```

run:

  service networking restart
  ifup eth0

### Debian Stupidity

For whatever retarded reason, the interface names have changed such that you can no
longer predict what they are going to be. They are dynamic and it makes it difficult
to write (maybe impossible) scripts that need access to standard interfaces.

To fix this mess and go back to the normal way the previous names eth0 and wlan0, 
just pass net.ifnames=0 on the kernel command line in /boot/cmdline.txt. So now
it looks something like this:

	dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=c3f225c6-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait net.ifnames=0

## Bypass known_hosts

Since all RPi's hostname are raspberrypi.local, it **sucks** when you try to
connect to a new one and you get the man-in-the-middle attack warning.

You can disable the check with:

    ssh -o UserKnownHostsFile=/dev/null pi@raspberrypi.local
