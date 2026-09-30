# Dev infrastructure

module "dev-infra" {
  source             = "./infra-app"
  env                = "dev"
  s3_bucket_name     = "infra-app-bucket"
  ec2_instance_count = 1
  ec2_instance_type  = "t2.micro"
  ec2_ami_id         = "ami-0351a972f17e4d123"
  hash_key           = "studentID"
}

# Prod infracstructure

module "prd-infra" {
  source             = "./infra-app"
  env                = "prd"
  s3_bucket_name     = "infra-app-bucket"
  ec2_instance_count = 2
  ec2_instance_type  = "t2.medium"
  ec2_ami_id         = "ami-0351a972f17e4d123"
  hash_key           = "studentID"
}

# test infrastructure

module "stg-infra" {
  source             = "./infra-app"
  env                = "stg"
  s3_bucket_name     = "infra-app-bucket"
  ec2_instance_count = 1
  ec2_instance_type  = "t2.small"
  ec2_ami_id         = "ami-0351a972f17e4d123"
  hash_key           = "studentID"
}

