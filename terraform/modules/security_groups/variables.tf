variable "project" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "bastion_cidr" {
  description = "CIDR block or IP allowed to SSH into EC2 (bastion host)"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR format"
  type        = string
}
