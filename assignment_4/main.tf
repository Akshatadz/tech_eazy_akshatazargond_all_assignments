provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "batch_role" {
  name = "aws-batch-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "batch.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "batch_policy" {
  role       = aws_iam_role.batch_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_batch_compute_environment" "example" {
  compute_environment_name = "akshata-compute-env"
  type                     = "MANAGED"
  service_role             = aws_iam_role.batch_role.arn

  compute_resources {
    type                = "EC2"
    instance_role       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:instance-profile/ecsInstanceRole"
    instance_type       = ["m5.large"]
    min_vcpus           = 0
    max_vcpus           = 2
    desired_vcpus       = 2
    subnets             = ["subnet-046844617195567f8"]
    security_group_ids  = ["sg-0c569cc8efea95a29"]
    ec2_configuration {
      image_type = "ECS_AL2"
    }
  }
}

resource "aws_batch_job_queue" "example" {
  name     = "akshata-job-queue"
  priority = 1
  state    = "ENABLED"

  compute_environments {
    order               = 1
    compute_environment = aws_batch_compute_environment.example.arn
  }
}

resource "aws_batch_job_definition" "example" {
  name     = "akshata-job-definition"
  type     = "container"

  container_properties = jsonencode({
    image   = "amazonlinux"
    vcpus   = 1
    memory  = 512
    command = ["bash", "-c", "echo Hello from AWS Batch"]
  })
}
