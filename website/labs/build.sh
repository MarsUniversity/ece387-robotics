#!/bin/bash

set -e

echo ""
echo "Building PDFs"
echo "==================="


rm -f *.pdf

for DOC in 'lab1' 'lab2' 'lab3' 'lab4' 'lab5' 'final_project'
do
	echo ">" ${DOC}
	pandoc ${DOC}.md -V geometry:margin=1in -s --latex-engine=pdflatex -o ${DOC}.pdf
	echo "-------------------"
done
