#!/bin/bash
set -e 

source components/common.sh 

 echo -n "Installing nginx: "
 yum install nginx -y  >>/tmp/frontend.log 
 stat $?

 systemctl enable nginx 

  echo -n "Starting nginx: "
   systemctl start nginx 
    stat $?     

  echo -n "Downloading the schema: "  
  curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
   stat $? 


 cd /usr/share/nginx/html
 rm -rf * 
 echo -n "Extracting the zip file: "
 unzip -o /tmp/frontend.zip >>/tmp/frpntend.log 
 stat $? 

 mv frontend-main/* .
 mv static/* . 
 echo -n "Performing cleanup: "
 rm -rf frontend-main README.md 
 stat $? 
  
 echo -n "Configuring reverse proxy:" 
 mv localhost.conf /etc/nginx/default.d/roboshop.conf 
 stat $? 

  echo -n "Starting nginx: "
  systemctl restart nginx 
  stat $?