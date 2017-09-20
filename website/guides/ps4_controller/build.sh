#!/bin/bash

pandoc readme.md -V geometry:margin=1in -s -N -o ps4_controller.pdf
