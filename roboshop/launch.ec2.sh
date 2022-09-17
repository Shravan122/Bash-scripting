#!/bin/bash 

COMPONENT=$1

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq ' .Images[].ImageId'|sed 's/"//g')
SGID="sg-092136d71863d6090"
echo "The AMI which we are using is $AMI_ID" 


aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro  --security-group-ids ${SGID}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq