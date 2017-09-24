#!/bin/bash

set -e

WWW=www

if [[ -d ${WWW} ]]; then
	rm -fr ${WWW}
fi

mkdir -p ${WWW}

echo "============================"
echo " Guides"
echo "============================"

for DIR in 'samba' 'software_install' 'roomba_setup' 'pandoc_setup' 'cheatsheet'
do
	echo ">" ${DIR}
	cd ${DIR}
	chmod a+x build.sh
	./build.sh
	cp *.pdf ../${WWW}
	cd ..
done

echo "Building guides webpage"
pandoc -s -S -c pandoc.css -t html5 -o guides.html guides.md
mv *.html ${WWW}
