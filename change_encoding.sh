#!/bin/bash

source ./encoding_function.sh

data=`cat -`

b="$(($3-1))"

c="$(($4-1))"

x=`echo $data | jq '. | length'`

for (( i=0; i<=$x-1; i++ ))

	do
		if [ $i -ge $b -a $i -le $c ];then
			
			 input=`echo $data | jq '.['$i'] | .'$1''`
			
			 output=`$2 $input`

			 y=`echo $data | jq '.['$i'] | .'$1'="'"$output"'"'`
			
			 array[$i]=$y
		else
                         y=`echo $data | jq '.['$i']'`
                        
			 array[$i]=$y
    		fi
	done

lst=$( IFS=','; echo "${array[*]}" )

echo '['$lst']' | jq .
