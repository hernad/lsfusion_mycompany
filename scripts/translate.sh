#!/bin/bash

while IFS=, read -r ORIG TRANS
do
    echo "$ORIG -> $TRANS"
    find -name  '*.lsf' | xargs sed -i "s@'$ORIG'@'$TRANS'@g"
done < translate.csv
