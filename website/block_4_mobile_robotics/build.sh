#!/bin/bash

set -e

WWW=www

if [[ -d ${WWW} ]]; then
  rm -fr ${WWW}
fi

mkdir -p ${WWW}

echo "============================"
echo " Block 4"
echo "============================"

# PPT
for PPT in 'lsn24' 'lsn25' 'lsn27' 'lsn28'
do
  echo "Copying ${PPT} to ${WWW}"
  cp ${PPT}/*.pptx ${WWW}
done

# jupyter notebooks
for JUPYTER in 'lsn33'
do
  echo "Moving ${JUPYTER}.tar.gz to ${WWW}"
  tar zcf ${JUPYTER}.tar.gz ${JUPYTER}
  mv *.gz ${WWW}
done

# do labs
cd lab
echo "Moving lab4.pdf and lab5.pdf to ${WWW}"
pandoc lab4.md -V geometry:margin=1in -s --latex-engine=pdflatex -o lab4.pdf
pandoc lab5.md -V geometry:margin=1in -s --latex-engine=pdflatex -o lab5.pdf
mv *.pdf ../${WWW}
cd ..

# do homeworks
cd homework
for HW in 'hw10' 'hw11'
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
pandoc -s -S -c pandoc.css -t html5 -o block-4.html block-4.md
cp pandoc.css ${WWW}
mv *.html ${WWW}
