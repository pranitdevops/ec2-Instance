#!/bin/bash

AMI=ami-0b4f379183e5706b9 
SG_ID=sg-037e9901dc1dc8621
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "user" "cart" "shipping" "web")

for i in  "${INSTANCES[@]}"
    do
            if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
            then
                INSTANCE_TYPE="t3.small"
            else
                INSTANCE_TYPE="t2.micro"
            fi

        IP_ADDRESS=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids sg-087e7afb3a936fce7 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
    echo "$i: $IP_ADDRESS"
done 


