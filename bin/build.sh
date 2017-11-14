#!/bin/bash
echo "Starting LaTeX builds"
mkdir _build

for semester in ./*/
do
    cd ${semester}
    for subject in ${semester}*/
    do
        cd ${subject}
        for exercise in ${semester}${subject}*/
        do
            cd ${exercise}
            filename=${subject,,}-${exercise,,}
            pdflatex -interaction=nonstopmode -halt-onerror ${filename}.tex
            cp ${filename}.pdf ../../../_build/${semester}${subject}
            cd ..
        done
        cd ..
    done
    cd ..
done

echo "Finished LaTeX builds"
