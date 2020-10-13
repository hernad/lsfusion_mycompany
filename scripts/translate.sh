#!/bin/bash

cnt=0
while IFS=, read -r ORIG TRANS
do
    ((cnt=cnt+1))
  
    ORIG=`echo $ORIG | sed -e 's/\[comma\]/,/g'`
    TRANS=`echo $TRANS | sed -e 's/\[comma\]/,/g'`
    ORIG=`echo $ORIG | sed -e 's/\[space\]/ /g'`
    
    # https://www.eso.org/~ndelmott/ascii.html
    # x5c - backslash, x27 - quote, x20 - space
    TRANS=`echo $TRANS | sed -e "s@\[quote\]@\\\\\x5c\\\\\x27@g"`
    TRANS=`echo $TRANS | sed -e 's/\[space\]/\\x20/g'`

   
    echo "$cnt: '$ORIG' -> '$TRANS'"
    find -name  '*.lsf' | xargs sed -i "s@'$ORIG'@'$TRANS'@g"
done < translate.csv
