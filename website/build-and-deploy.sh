#!/bin/bash

if [[ "$#" -eq 0 ]]; then
	echo "You must give an OS: windows, macos"
	echo "Example: ./build-and-deploy.sh macos"
	exit 1
elif [[ "$1" == "windows" ]]; then
	echo "Building for Windozes"
elif [[ "$1" == "macos" ]]; then
	echo "Building for macOS"
else
	echo "Unrecognized OS" "$1"
	exit 1
fi

./build.py
./deploy.sh "$1"


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
