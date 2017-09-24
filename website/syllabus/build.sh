#!/bin/bash

set -e

WWW=www

if [[ -d ${WWW} ]]; then
  rm -fr ${WWW}
fi

mkdir -p ${WWW}

echo "============================"
echo " Syllabus"
echo "============================"

pandoc syllabus.md -V geometry:margin=1in -s -o syllabus.pdf
pandoc -s -S --toc -c pandoc.css syllabus.md -t html5 -o index.html

mv syllabus.pdf ${WWW}
mv index.html ${WWW}
cp pandoc.css ${WWW}
