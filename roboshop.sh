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

        aws ec2 run-instances --image-id $AMI  --instance-type $INSTANCE_TYPE  --security-group-ids $SG_ID
done 


