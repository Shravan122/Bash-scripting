#!/bin/bash

source components/common.sh 

COMPONENT=payment

echo -n "Installing Python: " 
yum install python36 gcc python3-devel -y  &>> ${LOGFILE}
stat $?

USER_SETUP 

DOWNLOAD_AND_EXTRACT 

cd /home/${FUSER}/${COMPONENT} 
pip3 install -r requirements.txt 
stat $?