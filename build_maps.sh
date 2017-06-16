#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
while read name
do
    name=$(echo $name| tr -d '\15\32')
    rm -rf $DIR/../$name
    cp -r $DIR $DIR/../SmmCaptureEvolve.$name
done < $DIR/maps.txt
