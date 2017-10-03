#!/bin/bash

set -e

WWW=www

# if [[ -d ${WWW} ]]; then
#   rm -fr ${WWW}
# fi

mkdir -p ${WWW}

echo "============================"
echo " Block 1"
echo "============================"

# PPT
for PPT in 'lsn1' 'lsn2' 'lsn3'
do
  echo "Copying ${PPT} to ${WWW}"
  cp ${PPT}/*.pptx ${WWW}
done

# do labs
cd lab
echo "Moving lab1.pdf to ${WWW}"
pandoc lab1.md -V geometry:margin=1in -s --latex-engine=pdflatex -o lab1.pdf
mv *.pdf ../${WWW}
cd ..

# do homeworks
cd homework
for HW in 'hw123'
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
pandoc -s -S -c pandoc.css -t html5 -o block-1.html block.md
cp pandoc.css ${WWW}
mv *.html ${WWW}

# jupyter notebooks
CMD=$(command -v "zip")
# ls /c/
# ZZIP=/c/Program\ Files/7-Zip/7z.exe
# CMD=$ZZIP
# echo ${CMD}
# if [[ -z "${CMD}" ]]; then
#     echo "No zip found ... setting up path"
#     CMD="/c/Program Files/7-Zip/7z.exe a"
# fi

# CMD="/c/Program Files/7-Zip/7z.exe a"

pwd
ls

# jupyter notebooks
for JUPYTER in 'lsn4' 'lsn5'
do
  # echo "Moving ${JUPYTER}.tar.gz to ${WWW}"
  # tar zcf ${JUPYTER}.tar.gz ${JUPYTER}
  # mv *.gz ${WWW}
    echo "Moving ${JUPYTER}.zip to ${WWW}"
    ${CMD} -r ${JUPYTER}.zip ${JUPYTER}
    mv *.zip ${WWW}
done
