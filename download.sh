#!/bin/bash
urls=$(wl-paste)
mkdir downloaded
for url in $urls 
do
    extention=$(echo $url | grep -o ".[a-z]\+$")
    curl -s  $url > downloaded/$RANDOM$extention
done
