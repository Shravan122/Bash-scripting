#!/bin/bash 

set -e 

source components/common.sh 

COMPONENT=catalogue
FUSER=roboshop 

  echo -n "Configure yum Remos for nodejs:"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash  >>/tmp/${COMPONENT}.log 
  stat $?

  echo -n "Installing nodejs:"
  yum install nodejs -y  >>/tmp/${COMPONENT}.log
   stat $? 

   echo -n "Adding $FUSER user:" 
   useradd roboshop 
   stat $?

   echo -n "Downloading the $COMPONENT:"
    curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENET}/archive/main.zip" >>/tmp/${COMPONENT}.log
    stat $? 

    echo -n "Clean up of old $COMPONENT content:"
    rm -rf /home/${FUSER}/${COMPONENT} >>/tmp/${COMPONENT}.log 
    stat $?

   echo -n "Extracting $COMPONENT content:"
   cd /home/${FUSER}  >>/tmp/${COMPONENT}.log 
   unzip -o /tmp/${COMPONENT}.zip && mv ${COMPONENT}-main ${COMPONENT} && cd /home/${FUSER}/${COMPONENT} >>/tmp/${COMPONENT}.log 
   stat $?  

    echo -n "Installing $COMPONENt Dependencies:" 
    npm install 
    stat $?



