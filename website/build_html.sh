#!/bin/bash

set -e

ls
pwd
env

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

for DIR in 'labs' 'pandoc_setup' 'roomba_setup' 'samba' 'software_install' 'syllabus'
do
	echo ">" ${DIR}
	cd ${DIR}
	./build.sh
	mv *.pdf ../${WWW_PATH}

	if [[ -f "index.html" ]]; then
		mv index.html ../${WWW_PATH}
		cp pandoc.css ../${WWW_PATH}
	fi

	cd ../

	echo "-------------------"
done
