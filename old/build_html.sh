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
SRC=docs/handouts/syllabus

cd ${SRC}

# cat <<EOF > template.header
# <link rel='stylesheet' type='text/css' href='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css'>
# <script src='//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js'></script>
# EOF

# pandoc syllabus.md -H template.header --css pandoc.css --to=html5 -o index.html

# pandoc syllabus.md -H template.header --css pandoc.css --to=html5 -o index.html

pandoc -s -S --toc -c pandoc.css syllabus.md -t html5 -o index.html
cp index.html ${WWW_PATH}
cp pandoc.css ${WWW_PATH}
