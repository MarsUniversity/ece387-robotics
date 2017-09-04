#!/bin/bash

pandoc syllabus.md -V geometry:margin=1in -s -o syllabus.pdf
