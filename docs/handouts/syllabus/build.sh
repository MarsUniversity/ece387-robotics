#!/bin/bash

pandoc syllabus.md -V geometry:margin=1in -s -o syllabus.pdf
pandoc -s -S --toc -c pandoc.css syllabus.md -t html5 -o index.html
