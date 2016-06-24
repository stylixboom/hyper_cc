#!/bin/bash

# # # # # # # # # # # # # # # # # # # #
# JSON value extractor + CURL
# Author: Siriwat K.
# Created: 24 June 2016
# # # # # # # # # # # # # # # # # # # #
# Forked from https://gist.github.com/cjus/1047794

val=height

function jsonval {
    temp=`curl -s http://localhost:5000/chain | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w ${val}`
    echo ${temp##*|}
}

echo `jsonval` | cut -d ":" -f 2
