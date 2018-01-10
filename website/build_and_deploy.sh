#!/bin/bash

TRAVIS_BUILD=true

if [[ ${TRAVIS_BUILD} ]]; then
	./build.py
	./deploy.py
fi
