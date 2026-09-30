# Key pair
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

# Default VPC
resource "aws_default_vpc" "default" {
}

# Security group
resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "This will add a Terraform generated security group"
  vpc_id      = aws_default_vpc.default.id // Interpolation - is a way in which you can inherit or extract the values from a terraform block

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access open outbound"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# EC2 instance
resource "aws_instance" "my_instance" {
  count           = var.ec2_instance_count
  depends_on      = [aws_security_group.my_security_group, aws_key_pair.my_key]
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.ec2_instance_type
  ami             = var.ec2_ami_id
  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.env}-infra-app-instance"
    Environment = var.env
  }
}
