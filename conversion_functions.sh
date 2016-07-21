#!/bin/bash
function temp_Fahrenheit_to_Celsius()
{
tc=$(echo "scale=2;(5/9)*($1-32)"|bc)
echo $tc
}

function temp_Celsius_to_Fahrenheit()
{
tf=$(echo "scale=2;((9/5) * $1) + 32" |bc)
echo $tf
}

