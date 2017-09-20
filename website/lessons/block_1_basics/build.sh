#!/bin/bash

set -e

pandoc -s -S -c pandoc.css index.md -t html5 -o index.html
