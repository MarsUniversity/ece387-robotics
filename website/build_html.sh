#!/bin/bash

set -e

WWW_PATH=www

# clean house on website
if [[ -d "${WWW_PATH}" ]]; then
	echo "Revmoving main website directory ${WWW_PATH}"
	# rm -fr ${WWW_PATH}
fi

# re-create empty directory
mkdir -p ${WWW_PATH}

# dummy test
# cd www
# cat <<EOF > index.html
# hi
# EOF

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

# cd syllabus
# echo "> syllabus"
# echo "-------------------"
# chmod a+x build.sh
# ./build.sh
# mv syllabus.pdf ../${WWW_PATH}
# mv index.html ../${WWW_PATH}
# cp pandoc.css ../${WWW_PATH}
# cd ../

# guides

# cd "templates"
# echo "> templates"
# cp *.py ../${WWW_PATH}
# cp *.ipynb ../${WWW_PATH}
# cd ../
# echo "-------------------"
