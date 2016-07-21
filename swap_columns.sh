#!/bin/bash

colf=$1

coll=$2

data=`cat -`
x=`echo $data | jq '. | length'`

b="$(($3-1))"

c="$(($4-1))"

for(( i=0; i<=$x-1; i++))
        do

                if [ $i -ge $b -a $i -le $c ];then
                        input=`echo $data | jq '.['$i']'`
                        y=`echo ''$input'' | sed -e 's/\b'$colf'\b/tmp/' -e 's/\b'$coll'\b/tmpx/' -e 's/\btmp\b/'$coll'/' -e 's/\btmpx\b/'$colf'/'`
                        array[$i]=$y

                else
                        y=`echo $data | jq '.['$i']'`
                        array[$i]=$y
                fi

        done

lst=$( IFS=','; echo "${array[*]}" )

echo '['$lst']' | jq .

