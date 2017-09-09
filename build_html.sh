#!/bin/bash

if [[ -d "www" ]]; then
	rm -fr www
fi

mkdir -p www
cd www
cat <<EOF > index.html
hi
EOF
