#!/bin/bash

set -e

WWW=www

if [[ -d ${WWW} ]]; then
  rm -fr ${WWW}
fi

mkdir -p ${WWW}

echo "============================"
echo " Block 3"
echo "============================"

# PPT
for PPT in 'lsn21'
do
  echo "Copying ${PPT} to ${WWW}"
  cp ${PPT}/*.pptx ${WWW}
done

# jupyter notebooks
for JUPYTER in 'lsn11' 'lsn14' 'lsn15' 'lsn19'
do
  echo "Moving ${JUPYTER}.tar.gz to ${WWW}"
  tar zcf ${JUPYTER}.tar.gz ${JUPYTER}
  mv *.gz ${WWW}
done

# do labs
cd lab
echo "Moving lab3.pdf to ${WWW}"
pandoc lab3.md -V geometry:margin=1in -s --latex-engine=pdflatex -o lab3.pdf
mv *.pdf ../${WWW}
cd ..

# do homeworks
cd homework
for HW in 'hw6' 'hw7' 'hw8' 'hw9'
do
  echo "Moving ${HW} to ${WWW}"
  pandoc ${HW}.md -V geometry:margin=1in -s -o ${HW}.pdf
  mv *.pdf ../${WWW}
done
cd ..

# do references
cd references
cp *.pdf ../${WWW}
cd ..

echo "Building block webpage"
pandoc -s -S -c pandoc.css -t html5 -o block-3.html block-3.md
cp pandoc.css ${WWW}
mv *.html ${WWW}
