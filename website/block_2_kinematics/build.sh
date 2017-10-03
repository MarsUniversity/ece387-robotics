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

# PPT
for PPT in 'lsn7'
do
  echo "Copying ${PPT} to ${WWW}"
  cp ${PPT}/*.pptx ${WWW}
done

# jupyter notebooks
CMD=$(command -v "zip")
echo ${CMD}
if [[ -z "${CMD}" ]]; then
    CMD="/c/Program\ Files/7-Zip/7z.exe a"
fi

# jupyter notebooks
for JUPYTER in 'lsn8' 'lsn9'
do
  # echo "Moving ${JUPYTER}.tar.gz to ${WWW}"
  # tar zcf ${JUPYTER}.tar.gz ${JUPYTER}
  # mv *.gz ${WWW}
	echo "Moving ${JUPYTER}.zip to ${WWW}"
	${CMD} -r ${JUPYTER}.zip ${JUPYTER}
	mv *.zip ${WWW}
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
