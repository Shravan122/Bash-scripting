#!/bin/bash

source components/common.sh 

COMPONENT=payment

echo -n "Installing Python: " 
yum install python36 gcc python3-devel -y  &>> ${LOGFILE}
stat $?

USER_SETUP 

DOWNLOAD_AND_EXTRACT 

cd /home/${FUSER}/${COMPONENT} 
pip3 install -r requirements.txt  &>> ${LOGFILE}
stat $? 

USER_ID=$id{id -u roboshop}
GROUP_ID=$id{id -g roboshop} 

echo -n "Updating the $COMPONENT.ini file:"
sed -i -e "/^uid/ c uid=${USERID}" -e "/gid/c gid=${GROUPID}" payment.ini 
stat $?  

CONFIG_SVC


