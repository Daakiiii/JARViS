variable "aws_region" {
  description = "Region AWS cible"
  type        = string
  default     = "eu-west-3"
}

variable "project" {
  description = "Nom du projet"
  type        = string
  default     = "jarvis"
}

variable "environment" {
  description = "Environnement cible"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "db_password" {
  description = "Mot de passe RDS"
  type        = string
  sensitive   = true
}
