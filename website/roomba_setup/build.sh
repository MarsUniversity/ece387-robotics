#!/bin/bash

pandoc roomba_setup.md -V geometry:margin=1in -N -s  -o roomba_setup.pdf
pandoc access_point.md -V geometry:margin=1in -N -s  -o access_point.pdf
