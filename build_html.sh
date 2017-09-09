#!/bin/bash

# clean house
if [[ -d "www" ]]; then
	rm -fr www
fi

# re-create empty directory
mkdir -p www

# dummy test
# cd www
# cat <<EOF > index.html
# hi
# EOF

WWW_PATH=../../../www

cd docs/handouts/syllabus
pandoc syllabus.md -o index.html
mv index.html ${WWW_PATH}
