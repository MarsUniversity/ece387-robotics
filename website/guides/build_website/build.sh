#!/bin/bash

pandoc readme.md -V geometry:margin=1in -s  -o pandoc_setup.pdf
