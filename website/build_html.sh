#!/bin/bash

set -e

WWW_PATH=www

# clean house on website
# if [[ -d "${WWW_PATH}" ]]; then
# 	echo "Revmoving main website directory ${WWW_PATH}"
# 	rm -fr ${WWW_PATH}
# fi

# re-create empty directory
mkdir -p ${WWW_PATH}

# dummy test
# cd www
# cat <<EOF > index.html
# hi
# EOF

# remove the .DS_Store files
find . -type f -name '.DS_Store' -exec rm {} +

chmod a+x build_html.sh

for DIR in 'syllabus' 'block_1_basics' 'block_2_kinematics' 'block_3_vision' 'block_4_mobile_robotics' 'guides' 'templates'
do
	echo ">" ${DIR}
	cd ${DIR}
	chmod a+x build.sh
	./build.sh

	cd www
	mv * ../../${WWW_PATH}
	cd ..
	# rm -fr www

	cd ..

	echo "-------------------"
done

exit 0
