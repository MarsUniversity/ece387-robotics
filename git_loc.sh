#!/usr/bin/env bash

set -e

loc () {
	echo "=========================================="
    echo "   $1"
    echo "=========================================="

	TMP=/var/tmp/temp-linecount-repo

	git clone --quiet --depth 1 "$1" ${TMP}
	printf "('${TMP}' will be deleted automatically)\n\n\n"
	cloc ${TMP}
	rm -rf ${TMP}
}

BASE="https://github.com/MomsFriendlyRobotCompany/"

for REPO in "pycreate2" "nxp_imu" "opencvutils" "fake_rpi" "ins_nav"
do
  loc ${BASE}${REPO}
done


loc "https://github.com/MarsUniversity/ece387"
