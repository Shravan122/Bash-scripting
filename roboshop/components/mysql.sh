#!/bin/bash 

set -e 

COMPONENT=mysql
LOGFILE=/tmp/robot.log

 
   echo -n "Configuring the $COMPONENT repo:" 
   curl -s -L -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/${COMPONENT}.repo
   stat $?





 


