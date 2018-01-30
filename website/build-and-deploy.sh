#!/bin/bash

if [[ "$#" -eq 0 ]]; then
	echo "You must give an OS"
	echo "./deploy.sh windows   OR   ./deploy.sh macos"
	exit 1
fi

OS=$1
if [[ "${OS}" != "windows" && "${OS}" != "macos" ]]; then
	echo "Unrecognized OS: ${OS}"
	exit 1
fi

./build.py
./deploy.sh "${OS}"


# if [[ ${TRAVIS} ]]; then
# 	return 0
# fi
#
# # travis deploy
# if true; then
# 	./build.py
# 	./deploy.sh
# fi
#
# # surge deploy -- it has issues with pdfs
# if false; then
# 	./build.py
# 	surge --domain https://ece387.surge.sh --project www
# fi
