variable "project" {
  description = "Project name"
  type        = string
}

variable "engine" {
  description = "Database engine (e.g., mysql or postgres)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "DB instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for RDS"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security Group ID for RDS"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "drupaldb"
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
