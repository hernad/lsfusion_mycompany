#!/bin/bash


while IFS=, read -r ORIG TRANS
do
    
    ORIG=`echo $ORIG | sed -e 's/\[comma\]/,/g'`
    TRANS=`echo $TRANS | sed -e 's/\[comma\]/,/g'`
    ORIG=`echo $ORIG | sed -e 's/\[space\]/ /g'`
    TRANS=`echo $TRANS | sed -e 's/\[space\]/ /g'`
    # x5c - backslash, x27 - quote
    TRANS=`echo $TRANS | sed -e "s@\[quote\]@\\\\\x5c\\\\\x27@g"`

   
    echo "'$ORIG' -> '$TRANS'"
    find -name  '*.lsf' | xargs sed -i "s@'$ORIG'@'$TRANS'@g"
done < translate.csv
