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

cat <<EOF > template.header
<link rel='stylesheet' type='text/css' href='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css'>
<script src='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js'></script>
EOF

pandoc syllabus.md -H template.header -o index.html
mv index.html ${WWW_PATH}
