#!/bin/bash

a=10
# a is 10 and is integer

b=abc
# abc is string

d=150 

Date=$(Date +%F)


#### No datatypes in bash scripting.Everthing is a string by default:

echo value of a is : $a
echo $a
echo "${b}"
echo "${d}"

echo value of d is : $d

DATE=2022-09-05
echo "good morning, todays date is $DATE"



