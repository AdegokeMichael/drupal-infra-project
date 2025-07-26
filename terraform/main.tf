module "vpc" {
  source               = "./modules/vpc"
  project              = "drupal-app"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
  azs                  = ["us-east-1a", "us-east-1b"]
}


module "nat_gateway" {
  source             = "./modules/nat_gateway"
  project            = "drupal-app"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnets[0]
  private_subnet_ids = module.vpc.private_subnets
  igw_id             = module.vpc.igw_id  # From root if you bring IGW out of the VPC module
 
}


module "security_groups" {
  source        = "./modules/security_groups"
  project       = "drupal-app"
  vpc_id        = module.vpc.vpc_id
  bastion_cidr  = "102.89.22.112/32" # or subnet of bastion instance
  my_ip_cidr     = var.my_ip_cidr
}

module "ec2" {
  source              = "./modules/ec2"
  project             = "drupal-app"
  ami_id              = var.ami_id # Ubuntu 22.04 in your region
  instance_type       = var.instance_type
  key_name            = var.key_name
  public_subnet_id    = module.vpc.public_subnets[0]
  private_subnet_ids  = module.vpc.private_subnets
  root_volume_size    = var.root_volume_size
  root_volume_type    = var.root_volume_type
  bastion_sg_id       = module.security_groups.bastion_sg_id
  app_sg_id           = module.security_groups.ec2_sg_id
}

module "alb" {
  source             = "./modules/alb"
  project            = "drupal-app"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnets
  alb_sg_id          = module.security_groups.alb_sg_id
  app_instance_ids   = module.ec2.app_instance_ids
}


module "rds" {
  source             = "./modules/rds"
  project            = "drupal-app"
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  private_subnet_ids = module.vpc.private_subnets
  db_sg_id           = module.security_groups.rds_sg_id
  db_name            = "drupaldb"
  db_username        = var.db_username
  db_password        = var.db_password
}


