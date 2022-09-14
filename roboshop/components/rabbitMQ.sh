#!/bin/bash

source components/common.sh 

COMPONENT=rabbitmq 
LOGFILE=/tmp/robot.log

echo -n "Installing Erlang dependency:"
yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y  &>>${LOGFILE}
stat $?
 
 echo -n "Configuring the YUM repo for $COMPONENT:"
 curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash &>>${LOGFILE}
 stat $? 

 echo -n "Installing RabbitMQ:"
 yum install rabbitmq-server -y &>>${LOGFILE}
 stat $?