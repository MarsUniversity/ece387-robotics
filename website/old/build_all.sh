#!/bin/bash

set -e

WWW_PATH=../../www
# START=/Users/kevin/github/ece387/docs/handouts
START=`pwd`

mkdir -p www

echo ""
echo "Building PDFs"
echo "==================="

for DIR in 'labs/lab1' 'labs/lab2' 'labs/lab3' 'labs/lab4' 'labs/lab5' 'samba' 'software_install' 'syllabus' 'roomba_setup' 'pandoc_setup'
do
	echo ">" ${DIR}
	cd ${DIR}
	rm -f *.pdf
	./build.sh
	cd ${START}
	echo "-------------------"
done
