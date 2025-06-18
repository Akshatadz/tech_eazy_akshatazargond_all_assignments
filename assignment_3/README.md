# Assignment 3: AWS Infrastructure Provisioning using Terraform

## Overview

This project provisions an AWS EC2 instance with a custom IAM Role and Instance Profile using Terraform. The IAM role is configured with limited S3 permissions to allow only log file uploads.

## Resources Created

- IAM Role: Role_B_Assignment3
- IAM Instance Profile
- EC2 Instance with Role_B attached

## How to Deploy

1. Open Git Bash in the project directory.
2. Run:
   terraform init  
   terraform validate  
   terraform apply

## How to Test IAM Permissions

After launching the EC2 instance:

1. SSH into the instance using the `.pem` file.
2. Run the following commands inside the EC2 instance:
   echo "Test log upload" > dummy.log  
   aws s3 cp dummy.log s3://tech-eazy-akshata-logs/

## Cleanup

To destroy all resources:
   terraform destroy

## Notes

- No AWS access keys are hardcoded.
- The `.pem` file is not uploaded to GitHub.
- Configuration is in `main.tf`.

## Author

Akshata Zargond

