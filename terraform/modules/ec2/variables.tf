variable "project" {
  description = "Project name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (use Ubuntu)"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair for SSH access"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet for bastion host"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnets for app servers"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "Security group ID for bastion"
  type        = string
}

variable "app_sg_id" {
  description = "Security group ID for app servers"
  type        = string
}

variable "app_count" {
  description = "Number of app servers"
  type        = number
  default     = 2
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}
