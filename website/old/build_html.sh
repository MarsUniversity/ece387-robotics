#!/bin/bash

WWW_PATH=../../../www
SRC=syllabus


cd ${SRC}

# clean house
if [[ -d "${WWW_PATH}" ]]; then
	rm -fr ${WWW_PATH}
fi

# re-create empty directory
mkdir -p ${WWW_PATH}

# dummy test
# cd www
# cat <<EOF > index.html
# hi
# EOF

pandoc -s -S --toc -c pandoc.css syllabus.md -t html5 -o index.html
cp index.html ${WWW_PATH}
cp pandoc.css ${WWW_PATH}
