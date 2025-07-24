provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile  # Optional, if you're using named AWS CLI profiles
}
