


# TechEazy AWS + DevOps Internship – All Assignments

Name: Akshata Zargond  
Email: akshata17003@gmail.com  

## 1. Assignment 1: EC2 Automation with Shell Script

### What I Did:

1.1 Wrote a script named deploy.sh  

1.2 The script performs:
    - Launches a t2.micro EC2 instance using Amazon Linux 2023 AMI  
    - Waits for 15 minutes (to simulate workload)  
    - Stops the instance automatically to save cost  

### How I Ran It:

1.3 Used Git Bash terminal  
1.4 Ran the command: `bash deploy.sh`  
1.5 Made sure:
    - AWS CLI is configured  
    - A key pair named 'mykey' exists  

### Security:

1.6 No .pem file uploaded to GitHub  
1.7 No credentials or secrets hardcoded  

###  Screenshots
![EC2 Stopped](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/screenshots/screenshots1_ec2_stopped.png)



## 2. Assignment 2: IAM + S3 + EC2 Automation

### What I Did:

2.1 Created two IAM roles: 

    - Role_A: Read-only access to S3  
    - Role_B: Write-only access to S3  
    
2.2 Launched an EC2 instance with Role_B attached  
2.3 Updated deploy.sh to upload a dummy log to S3  
2.4 Created a private S3 bucket named tech-eazy-akshata-logs  
2.5 Applied a lifecycle rule to auto-delete logs after 7 days  

### How I Tested:
2.6 SSH into EC2 instance using `.pem` 

2.7 Ran inside instance:  
    `echo "log data" > dummy.log`  
    `aws s3 cp dummy.log s3://tech-eazy-akshata-logs/sample-log.log`
    
2.8 Verified Role_A by running:  
    `aws s3 ls s3://tech-eazy-akshata-logs`  

### Security:
2.9 No credentials committed  
2.10 .pem file was removed and excluded using .gitignore

###  Screenshots
![S3 Bucket](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/screenshots/screenshots2_s3_bucket.png)
![EC2 with Role B](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/screenshots/screenshots3_ec2_role_b.png)




## 3. Assignment 3: Terraform for AWS Infrastructure

### What I Did:
3.1 Used Terraform to create:
    - EC2 instance  
    - IAM Role_B  
    - IAM instance profile to attach Role_B to EC2  
    
3.2 Wrote everything inside main.tf  

### How I Deployed:

3.3 Ran the following commands:
    `terraform init`  
    `terraform validate`  
    `terraform apply`  

### How I Tested:

3.4 SSH into EC2, then:
    `echo "log data" > dummy.log`  
    `aws s3 cp dummy.log s3://tech-eazy-akshata-logs/`  

### To Clean Up:

3.5 Ran: `terraform destroy`  

### Security:

3.6 Used .gitignore to exclude:
    - *.pem  
    - *.log  
    - *.tfstate and backup files  
    - .terraform/ directory  
    
3.7 Removed any accidentally pushed secrets using git filter-repo 

###  Screenshots
![Terraform IAM Role](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/screenshots/screenshots4_Role_B_Assignment3.png)



## 4. Assignment 4: AWS Batch with Terraform + CLI

### What I Did:

4.1 Created IAM Role for AWS Batch execution  
4.2 Defined Batch **Compute Environment** using EC2  
4.3 Configured **Job Queue** and **Job Definition** via Terraform  
4.4 Wrote a shell script (`job-script.sh`) that echoes a message  
4.5 Uploaded the shell script to an **S3 bucket**  
4.6 Submitted a Batch job using **AWS CLI**

### Technologies Used:
- Terraform  
- AWS Batch  
- IAM Roles  
- S3  
- AWS CLI

### How I Deployed:

Ran the following commands:
```bash
terraform init  
terraform validate  
terraform apply  

Then submitted job:

aws batch submit-job \
  --job-name hello-batch-job \
  --job-queue akshata-job-queue \
  --job-definition akshata-job-definition

Testing:
Verified the job status transitioned from Runnable → Succeeded

Checked job logs and dashboard

Security:
IAM roles used properly

.tfstate, secrets, and keys excluded with .gitignore

S3 bucket was private and lifecycle rule applied

## Screenshots

##Screenshots

### EC2 Instance Role creation  
![EC2 Instance Role](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/ecs_instance_role.png)

### IAM Role for Batch Execution  
![Batch Execution Role](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/batch_execution_role.png)

### S3 Bucket Created  
![S3 Bucket](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/s3_bucket_created.png)

### Terraform Apply Output  
![Terraform Apply Output](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/terraform_apply_success.png)

### Batch Compute Environment  
![Batch Compute Env](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/batch_compute_environment.png)

### Batch Job Queue  
![Batch Job Queue](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/batch_job_queue.png)

### Batch Job Definition  
![Batch Job Definition](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/batch_job_definition.png)

### Job Submitted via CLI  
![Job Submitted](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/batch_job_submitted_cli.png)

### Job Dashboard (Success)  
![Job Success](https://raw.githubusercontent.com/Akshatadz/tech_eazy_akshatazargond_all_assignments/main/assignment_4/screenshots/batch_job_success_dashboard.png)





### Final Notes:
4.1 All assignments were tested in a real AWS account  
4.2 Separate folders used: assignment_1, assignment_2, assignment_3 , assignment_4 
 



