## TechEazy AWS + DevOps Internship – All Assignments
Name: Akshata Zargond
Email: akshata17003@gmail.com

 ### Assignment 1: EC2 Automation with Shell Script
What I did:

-- Wrote a script deploy.sh to automate EC2 tasks.
The script does three things:

1.Launches a t2.micro EC2 instance using Amazon Linux 2023 AMI.

2.Waits 15 minutes to simulate some work.

3.Stops the instance to save cost.

#### How I ran it:

I used Git Bash and ran:
bash deploy.sh
Before that, I set up AWS CLI and made sure a key pair named mykey was available.

Security:
.pem file not uploaded to GitHub.
No credentials added.

### Assignment 2: IAM + S3 + Automation Script
What I did:
Created 2 IAM roles:

1.Role_A: Can only read files from S3.
2.Role_B: Can only upload/write files to S3.
3.Launched EC2 and attached Role_B.

4.Used script to upload a log file to my S3 bucket tech-eazy-akshata-logs.

5.Added a rule to delete files after 7 days.

#### How I tested:
 -- SSH into EC2.

-- Created dummy log file and uploaded using:

--- aws s3 cp dummy.log s3://tech-eazy-akshata-logs/sample-log.log
--- Checked from Role_A using:

aws s3 ls s3://tech-eazy-akshata-logs

### Assignment 3: Terraform for AWS Infrastructure

#### What I did:
1.Used main.tf file to create:
2.EC2 instance
3.IAM Role_B with S3 write access
4.IAM instance profile to attach role to EC2
5.Uploaded logs from EC2 to S3

#### How I deployed:

terraform init
terraform validate
terraform apply

#### How I tested:
echo "log data" > dummy.log
aws s3 cp dummy.log s3://tech-eazy-akshata-logs/

#### To clean up:
terraform destroy

####  Security 
Used .gitignore to exclude:
.pem files
.log, .tfstate, .terraform/ folders
Did not push credentials or secrets



#### Notes
All tasks tested on real AWS account

.pem file deleted securely from GitHub

Repository cleaned up using .gitignore and git filter-repo
