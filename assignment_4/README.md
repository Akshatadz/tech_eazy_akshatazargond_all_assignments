## ✅ Assignment 4: AWS Batch with Terraform + CLI

###  What I Did:
- Created IAM Role for Batch execution
- Defined Batch **Compute Environment** using EC2
- Configured **Job Queue** and **Job Definition** via Terraform
- Wrote a shell script (`job-script.sh`) that echoes a message
- Uploaded shell script to **S3 bucket**
- Submitted a Batch job via **AWS CLI**

###  Technologies:
- Terraform
- AWS Batch
- IAM Roles
- S3
- AWS CLI

###  Commands Used:

```bash
terraform init
terraform validate
terraform apply

Job submission via CLI:

bash
Copy
Edit
aws batch submit-job \
  --job-name hello-batch-job \
  --job-queue akshata-job-queue \
  --job-definition akshata-job-definition

# Testing:
Job successfully transitioned from Runnable → Succeeded

Verified via AWS Batch dashboard


## 📸 Screenshots

📸 Screenshots

### EC2 Instance Role creation  
![EC2 Instance Role](screenshots/ecs_instance_role.png)

### IAM Role for Batch Execution  
![Batch Execution Role](screenshots/batch_execution_role.png)

### S3 Bucket Created  
![S3 Bucket](screenshots/s3_bucket_created.png)

### Terraform Apply Output  
![Terraform Apply Output](screenshots/terraform_apply_success.png)

### Batch Compute Environment  
![Batch Compute Env](screenshots/batch_compute_environment.png)

### Batch Job Queue  
![Batch Job Queue](screenshots/batch_job_queue.png)

### Batch Job Definition  
![Batch Job Definition](screenshots/batch_job_definition.png)

### Job Submitted via CLI  
![Job Submitted](screenshots/batch_job_submitted_cli.png)

### Job Dashboard (Success)  
![Job Success](screenshots/batch_job_success_dashboard.png)

