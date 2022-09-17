#!/bin/bash

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq ' .Images[].ImageId'|sed 's/"//g')
echo "The AMI which we are using is $AMI_ID"