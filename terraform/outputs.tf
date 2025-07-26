output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}

output "app_private_ips" {
  value = module.ec2.app_private_ips
}

output "app_instance_ids" {
  value = module.ec2.app_instance_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
