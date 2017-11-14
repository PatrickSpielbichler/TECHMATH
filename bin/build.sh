#!/bin/bash
echo "Starting LaTeX builds"
mkdir _build

for semester in ./src/*/
do
    cd ${semester}
    semester=${semester%*/}
    semester=${semester##*/}

    mkdir ../../_build/${semester}
    for subject in ./*/
    do
        cd ${subject}
        subject=${subject%*/}
        subject=${subject##*/}

        mkdir ../../../_build/${semester}/${subject}

        for exercise in ./*/
        do
            if [ -d ${exercise} ];then
                cd ${exercise}
                exercise=${exercise%*/}
                exercise=${exercise##*/}
                filename=${subject,,}-${exercise,,}
                if [ -f ${filename}.tex ]; then
                    pdflatex -interaction=nonstopmode -halt-on-error ${filename}.tex
                    mv ${filename}.pdf ../../../../_build/${semester}/${subject}/${filename}.pdf
                fi
                cd ../
            fi
        done
        cd ..
    done
    cd ../..
done

echo "Finished LaTeX builds"
