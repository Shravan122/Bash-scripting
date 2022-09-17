#!/bin/bash 

# If $1 is empty or $1 is not supplied, then I want to mark it as failure.
if [ -z  "$1" ] ; then 
    echo -e "\e[31m Machine Name Is Missing \e[0m"
    exit 1
fi

COMPONENT=$1 
ZONEID="Z088865137EDV0W245DON"

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq ' .Images[].ImageId'|sed 's/"//g')
SGID="sg-092136d71863d6090"
echo "The AMI which we are using is $AMI_ID" 


PRIVATE_IP=$(aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro  --security-group-ids ${SGID}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"  --instance-market-options "MarketType=spot, SpotOptions={SpotInstanceType=persistent,InstanceInterruptionBehavior=stop}" | jq '.Instances[].PrivateIpAddress' | sed -e 's/"//g')

echo "Private IP of the created machine is $PRIVATE_IP"
echo "Spot Instance $COMPONENT is ready:"
echo "Creating Route53 Record . . . . :" 

 sed -e "s/PRIVATEIP/${PRIVATE_IP}/" -e "s/COMPONENT/${COMPONENT}/" r53.json  >/tmp/record.json
aws route53 change-resource-record-sets --hosted-zone-id ${ZONEID} --change-batch file:///tmp/record.json | jq 
