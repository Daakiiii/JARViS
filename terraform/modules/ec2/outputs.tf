output "asg_name" { value = aws_autoscaling_group.app.name }
output "sg_id"    { value = aws_security_group.ec2.id }
