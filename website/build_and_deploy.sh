#!/bin/bash

TRAVIS_BUILD = false

if [[ ${TRAVIS_BUILD} ]]; then
	./build.py
	./deploy.py
fi
