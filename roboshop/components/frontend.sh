#!/bin/bash 
set -e  # ensure your script will stop if any of the instruction fails



source components/common.sh

echo "Installing nginx: "
yum install nginx -y   >> /tmp/frontend.log 

if [ $? -eq 0 ] : then
   echo -e "\e[32m Success \e[0m"

else 

   echo -e "\e [31m Faliure. look for the logs \e[0m"
fi 

systemctl enable nginx 

echo "starting nginx: "
systemctl start nginx 
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip   >> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

  systemctl restart nginx
