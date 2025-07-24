terraform {
  backend "s3" {
    bucket         = "terra-bucket1"
    key            = "drupal-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
