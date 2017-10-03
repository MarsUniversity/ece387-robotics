#!/usr/bin/env bash

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
for PPT in 'lsn24'
do
  echo "Copying ${PPT} to ${WWW}"
  cp ${PPT}/*.pptx ${WWW}
  echo "done"
done

# jupyter notebooks
CMD=$(command -v "zip")
echo ${CMD}
if [[ -z "${CMD}" ]]; then
    CMD="/c/Program\ Files/7-Zip/7z.exe a"
fi

for JUPYTER in 'lsn25' 'lsn31' 'lsn33'
do
  echo "Moving ${JUPYTER}.zip to ${WWW}"
  ${CMD} -r ${JUPYTER}.zip ${JUPYTER}
  mv *.zip ${WWW}
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

cd references
echo "Copying references"
cp *.pdf ../${WWW}
cd ..

echo "Building block webpage"
pandoc -s -S -c pandoc.css -t html5 -o block-4.html block-4.md
cp pandoc.css ${WWW}
mv *.html ${WWW}
