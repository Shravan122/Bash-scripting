#!/bin/bash 

# If $1 is empty or $1 is not supplied, then I want to mark it as failure.
if [ -z  "$1" ] ; then 
    echo -e "\e[31m Machine Name Is Missing \e[0m"
    exit 1
fi

COMPONENT=$1

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq ' .Images[].ImageId'|sed 's/"//g')
SGID="sg-092136d71863d6090"
echo "The AMI which we are using is $AMI_ID" 


aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro  --security-group-ids ${SGID}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"  --instance-market-options "MarketType=spot, SpotOptions={SpotInstanceType=persistent,InstanceInterruptionBehavior=stop}" | jq 

echo "Spot Instance $COMPONENT is ready:"