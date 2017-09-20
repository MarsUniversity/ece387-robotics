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

## Bypass known_hosts

Since all RPi's hostname are raspberrypi.local, it **sucks** when you try to connect
to a new one and you get the man-in-the-middle attack warning.

You can disable the check with:

    ssh -o UserKnownHostsFile=/dev/null pi@raspberrypi.local
