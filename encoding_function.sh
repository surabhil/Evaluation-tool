#!/bin/bash

function change_epoch_to_date()
{
datex="$(date -d '1970-01-01 '$1'sec')"
echo "$datex"
}

function change_date_to_epoch()
{
datex="$(date -d "$DATE1" +%s)"
echo "$datex"
}

function change_decimal_to_hexadecimal()
{
echo "obase=16; $1" | bc
}

function change_hexadecimal_to_decimal()
{
d=`echo $1 | sed -r 's/(\")//g'`
echo "ibase=16; $d" | bc | sed -r 's/(\")//g'
}
