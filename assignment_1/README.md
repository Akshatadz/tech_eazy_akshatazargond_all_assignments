# Assignment 1: AWS EC2 Automation Script

## What This Script Does

This script automatically does three things:
1. Launches an EC2 instance (Amazon Linux 2023).
2. Waits for 15 minutes to simulate workload.
3. Stops the instance to save money.

## How I Ran It

- I used Git Bash to run the shell script.
- The command I used: `bash deploy.sh`

## What I Prepared Before Running

- I installed and configured AWS CLI with my IAM user.
- I created a key pair named `mykey` on AWS.

## How I Checked

- After running the script, I went to the AWS Console.
- I saw that the EC2 instance launched and then stopped after 15 minutes.

## Security

- I did **not** upload any `.pem` file.
- No credentials are stored in the script.

## Author

Akshata Zargond
