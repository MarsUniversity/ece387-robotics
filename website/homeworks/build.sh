#!/bin/bash

set -e

for HW in 'hw123' 'hw4' 'hw5'
do 
    pandoc ${HW}.md -V geometry:margin=1in -s -o ${HW}.pdf
done