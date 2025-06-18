provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0f535a71b34f2d44a"
  instance_type = "t2.micro"
  key_name      = "mykey"

  iam_instance_profile = aws_iam_instance_profile.roleB_instance_profile.name

  tags = {
    Name = "assignment-3-ec2"
  }
}

resource "aws_iam_role" "roleB" {
  name = "Role_B_Assignment3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "roleB_policy" {
  name = "S3WritePolicy"
  role = aws_iam_role.roleB.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:PutObject"],
      Resource = "arn:aws:s3:::tech-eazy-akshata-logs/*"
    }]
  })
}

resource "aws_iam_instance_profile" "roleB_instance_profile" {
  name = "roleB-instance-profile"
  role = aws_iam_role.roleB.name
}
# Minor update for PR
