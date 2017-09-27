#!/usr/bin/env bash

CREATE="https://github.com/MomsFriendlyRobotCompany/pycreate2"
IMU="https://github.com/MomsFriendlyRobotCompany/nxp_imu"
CV="https://github.com/MomsFriendlyRobotCompany/opencvutils"
FAKE="https://github.com/MomsFriendlyRobotCompany/fake_rpi"
NAV="https://github.com/MomsFriendlyRobotCompany/ins_nav"


for REPO in ${CREATE} ${IMU} ${CV} ${FAKE} ${NAV}
do
  loc ${REPO}
done
