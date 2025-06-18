#!/bin/bash

# Assignment 1 - EC2 Automation Script
AMI_ID="ami-0f535a71b34f2d44a"
INSTANCE_TYPE="t2.micro"
KEY_NAME="mykey"
SECURITY_GROUP="launch-wizard-1"

echo "🚀 Launching EC2 instance..."
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-groups $SECURITY_GROUP \
  --query "Instances[0].InstanceId" \
  --output text)

echo "✅ Instance launched: $INSTANCE_ID"

echo "⏳ Waiting 15 minutes to simulate workload..."
sleep 900

echo "🛑 Stopping instance to save cost..."
aws ec2 stop-instances --instance-ids $INSTANCE_ID
echo "✅ Instance $INSTANCE_ID stopped."
# Minor update for PR
