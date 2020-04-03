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

RIGHT_MON_ID='E0CF5B67-FDDF-13D4-8C8D-64D7900F18A8'
LEFT_MON_ID='6652BC2D-F818-E3CE-F64D-C9E890B19458'
INTERNAL_SCREEN_ID='1B6E5E4F-F885-D5D9-12AC-423EA9E16E72'

INTERNAL_MODE='res:1680x1050 color_depth:8 scaling:on'
MON_MODE='res:1680x1050 hz:59 color_depth:4 scaling:off'
NO_ROTATE='degree:0'

function normalDisplays() {
    displayplacer\
        "id:$INTERNAL_SCREEN_ID $INTERNAL_MODE origin:(1680,0) degree:0" \
        "id:$RIGHT_MON_ID $MON_MODE $NO_ROTATE origin:(0,0)" \
        "id:$LEFT_MON_ID $MON_MODE $NO_ROTATE origin:(-1680,0)"
}

function mirrorDisplays() {
    displayplacer "id:$RIGHT_MON_ID+$LEFT_MON_ID+$INTERNAL_SCREEN_ID $MON_MODE $NO_ROTATE origin:(0,0)"
}

