#!/bin/bash

set -e

WWW_PATH=www

# clean house on website
# if [[ -d "${WWW_PATH}" ]]; then
# 	rm -fr ${WWW_PATH}
# fi

# re-create empty directory
mkdir -p ${WWW_PATH}

# dummy test
# cd www
# cat <<EOF > index.html
# hi
# EOF

chmod a+x build_html.sh

# for DIR in 'labs' 'pandoc_setup' 'roomba_setup' 'samba' 'software_install' 'syllabus'
for DIR in 'syllabus' 'labs'
do
	echo ">" ${DIR}
	cd ${DIR}
	chmod a+x build.sh
	./build.sh
	mv *.pdf ../${WWW_PATH}

	if [[ -f "index.html" ]]; then
		mv index.html ../${WWW_PATH}
		cp pandoc.css ../${WWW_PATH}
	fi

	cd ../

	echo "-------------------"
done
