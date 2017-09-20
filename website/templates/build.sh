#!/bin/bash

set -e

WWW=www

if [[ -d ${WWW} ]]; then
  rm -fr ${WWW}
fi

mkdir -p ${WWW}

echo "============================"
echo " Templates"
echo "============================"

cp *.py ${WWW}
cp *.ipynb ${WWW}
