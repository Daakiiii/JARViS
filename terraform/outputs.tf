output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns" {
  value = module.alb.alb_dns
}

output "asg_name" {
  value = module.ec2.asg_name
}
