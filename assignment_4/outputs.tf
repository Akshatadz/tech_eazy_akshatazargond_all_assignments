output "batch_job_queue_name" {
  value = aws_batch_job_queue.example.name
}

output "iam_role_name" {
  value = aws_iam_role.batch_role.name
}
