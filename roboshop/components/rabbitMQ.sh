#!/bin/bash

 source components/common.sh 

 COMPONENT=rabbitmq 

  echo -n "Installing Erlang dependecy:" 
  yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y
  stat $? 

  echo -n "Configuring the YUm for $COMPONENT:" 
  curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
  stat $?

  echo -n "Installing RabbitMQ:" 
  yum install rabbitmq-server -y 
  stat $? 

  echo -n "Starting $COMPONENT:" 
  systemctl enable rabbitmq-server 
  systemctl start rabbitmq-server
  stat $?

