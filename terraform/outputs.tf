output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "app_private_ips" {
  value = aws_instance.app[*].private_ip
}

output "app_instance_ids" {
  value = aws_instance.app[*].id
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
