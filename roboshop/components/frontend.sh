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

  echo -n "Downloading the schema"  
  curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
   stat $? 


 cd /usr/share/nginx/html
 rm -rf *
 unzip -o /tmp/frontend.zip >>/tmp/frpntend.log
 mv frontend-main/* .
 mv static/* .
 rm -rf frontend-main README.md
 mv localhost.conf /etc/nginx/default.d/roboshop.conf 

  echo -n "Starting nginx: "
  systemctl restart nginx 
  stat $?