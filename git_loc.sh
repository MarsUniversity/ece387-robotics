#!/usr/bin/env bash

BASE="https://github.com/MomsFriendlyRobotCompany/"
CREATE="pycreate2"
IMU="nxp_imu"
CV="opencvutils"
FAKE="fake_rpi"
NAV="ins_nav"
ECE="https://github.com/MarsUniversity/ece387"

for REPO in ${CREATE} ${IMU} ${CV} ${FAKE} ${NAV}
do
  echo "=========================================="
  echo "   ${REPO}"
  echo "=========================================="
  ./loc.sh ${BASE}${REPO}
done

./loc.sh ${ECE}
