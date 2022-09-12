#!/bin/bash
set -e 

source components/common.sh 

 echo "Installing nginx: "
 yum install nginx -y  >>/tmp/frontend.log 
    if [ $? -eq 0 ] ; then 
     echo -e "\e[32m Success \e[0m"
  else 
     echo -e "\e[31m Failure.Look for the logs \e[0m" 
   fi   

 systemctl enable nginx 

  echo "Starting nginx: "
   systemctl start nginx 
    if [ $? -eq 0 ] ; then 
      echo -e "\e[32m Success \e[0m"
    else 
      echo -e "\e[31m Failure.look for the logs \e[om" 
    fi       




 echo "Downloading the schema"  
 curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
    if [ $? -eq 0 ] ; then 
      echo -e "\e[32m Success \e[0m" 
    else 
      echo -e "\e[31m Failure.Look for the logs \e[0m" 
    fi  


 cd /usr/share/nginx/html
 rm -rf *
 unzip -o /tmp/frontend.zip >>/tmp/frpntend.log
 mv frontend-main/* .
 mv static/* .
 rm -rf frontend-main README.md
 mv localhost.conf /etc/nginx/default.d/roboshop.conf 

  echo "Starting nginx: "
  systemctl restart nginx 
   if [ $? -eq 0 ] ; then 
    echo -e "\e[32m Success \e[0m"
   else 
    echo -e "\e[31m Failure.Look for the logs \e[0m"
    

