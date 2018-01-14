#!/bin/bash
DEPLOY_SURGE=false
TRAVIS_BUILD=false

if [[ ${TRAVIS_BUILD} ]]; then
	./build.py
	./deploy.sh
fi

if [[ ${DEPLOY_SURGE} ]]; then
	./build.py
	surge --domain https://ece387.surge.sh --project www
fi
