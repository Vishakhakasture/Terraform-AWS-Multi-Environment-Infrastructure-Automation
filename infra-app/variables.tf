variable "env" {
  description = "This is the environment"
  type        = string
}

variable "s3_bucket_name" {
  description = "This is the bucket name for s3"
  type        = string
}

variable "ec2_instance_count" {
  description = "This is the number of ec2 instance"
  type        = number
}

variable "ec2_instance_type" {
  description = "This is the type of ec2 instance"
  type        = string
}

variable "ec2_ami_id" {
  description = "This is the ami id for ec2 instance"
  type        = string
}

variable "hash_key" {
  description = "This is the hash key for dynamodb"
  type        = string
}
