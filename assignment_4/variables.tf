variable "region" {
  description = "The AWS region to deploy in"
  default     = "ap-south-1"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = ["subnet-046844617195567f8"]
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-0c569cc8efea95a29"]
}
