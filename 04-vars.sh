#!/bin/bash

a=10
# a is 10 and is integer

b=abc
# abc is string

d=150 

Date=$(Date +%F)
LOGGEDIN_USERS=$(who | wc -l)


#### No datatypes in bash scripting.Everthing is a string by default:

echo value of a is : $a
echo $a
echo "${b}"
echo "${d}"

echo value of d is : $d
echo "Numbaer of LoggedIn Users are: $LOGGEDIN_USERS"
  

DATE=2022-09-05
echo "good morning, todays date is $DATE"



