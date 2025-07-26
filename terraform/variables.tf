variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "default"
}

variable "project" {
  description = "Name prefix for project resources"
  type        = string
  default     = "drupal-infra"
}

variable "environment" {
  description = "Environment tag (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "db_username" {
  description = "Master DB username"
  type        = string
}

variable "db_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size for EC2 in GiB"
  type        = number
  default     = 30
}

variable "root_volume_type" {
  description = "EBS volume type for EC2 root volume"
  type        = string
  default     = "gp3"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR format"
  type        = string
}
