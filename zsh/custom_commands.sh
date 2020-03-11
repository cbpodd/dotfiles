#!/bin/bash

# Merges branch $1 into branch $2
function gitMerge() {
  	git checkout $1
	git pull
	git checkout $2
	git merge $1
	git push
}

function texc() {
    file=$1
    CORE=${file%\.*}
    pdflatex "${file}"
    open -a Preview "${CORE}.pdf"
}
