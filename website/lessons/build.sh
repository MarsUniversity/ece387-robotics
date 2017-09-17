#!/bin/bash

set -e

WWW_PATH=../www

for DIR in 'block_1_basics' 'block_2_kinematics' 'block_3_vision' 'block_4_mobile_robotics' 
do
	echo ">" ${DIR}
	tar -czf ${DIR}.tgz ${DIR}
# 	mv ${DIR}.tgz ${WWW_PATH}

	echo "-------------------"
done
