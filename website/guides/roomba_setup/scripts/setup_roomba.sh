#!/bin/bash

set -e

# check if we are root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
	exit 1
fi

if [[ $# -eq 0 ]]; then
  echo "-----------------------------------------"
  echo "Please supply a hostname and IP Address"
  echo "-----------------------------------------"
  exit 1
fi

echo ""
echo "+-------------------------+"
echo "| Setting up Roomba       |"
echo "+-------------------------+"
echo ""


# set hostname --------------------------------------
HOSTNAME=$1
raspi-config nonint do_hostname $HOSTNAME

# set static IP address -----------------------------
echo "fix ip address"

# set SSID on wifi ----------------------------------
# note: SSID will be set too hostname
if [[ -f "/etc/hostapd/hostapd.conf" ]]; then
  echo ""
  echo "*** access point already setup ***"
  echo "manually change SSID in /etc/hostapd/hostapd.conf"
  echo ""
else
  ./setup-access-point.sh
fi

echo ""
echo "*** Done ***"
echo ""
