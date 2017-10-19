#!/bin/bash

set -e

WWW=www

if [[ -d ${WWW} ]]; then
  rm -fr ${WWW}
fi

mkdir -p ${WWW}

echo "============================"
echo " Block 2"
echo "============================"

# jupyter notebooks
CMD=$(command -v "zip")
for JUPYTER in 'lsn7'
do
  # echo "Moving ${JUPYTER}.tar.gz to ${WWW}"
  # tar zcf ${JUPYTER}.tar.gz ${JUPYTER}
  # mv *.gz ${WWW}
    echo "Moving ${JUPYTER}.zip to ${WWW}"
    ${CMD} -r ${JUPYTER}.zip ${JUPYTER}
    mv *.zip ${WWW}
done

# for pdfs
for NOTES in 'lsn8' 'lsn9'
do
  cd ${NOTES}
	echo "Copying ${NOTES} to ${WWW}"
	cp *.pdf ../${WWW}
  if [[ -f "dh.mp4" ]]; then
    echo "Found movie"
    cp *.mp4 ../${WWW}
  fi
  cd ..
done

# do labs
cd lab
echo "Moving lab2.pdf to ${WWW}"
pandoc lab2.md -V geometry:margin=1in -s --latex-engine=pdflatex -o lab2.pdf
mv *.pdf ../${WWW}
cd ..

# do homeworks
cd homework
for HW in 'hw4' 'hw5'
do
  echo "Moving ${HW} to ${WWW}"
  pandoc ${HW}.md -V geometry:margin=1in -s -o ${HW}.pdf
  mv *.pdf ../${WWW}
done
cd ..

# do references
cd references
echo "Copying references"
cp *.pdf ../${WWW}
cd ..

echo "Building block webpage"
pandoc -s -S -c pandoc.css -t html5 -o block-2.html block-2.md
cp pandoc.css ${WWW}
mv *.html ${WWW}
