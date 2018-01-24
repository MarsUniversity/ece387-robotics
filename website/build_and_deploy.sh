#!/bin/bash

# travis deploy
if true; then
	./build.py
	./deploy.sh
fi

# surge deploy -- it has issues with pdfs
if false; then
	./build.py
	surge --domain https://ece387.surge.sh --project www
fi
