terraform {
  backend "s3" {
    bucket         = "jarvis-tfstate-daakiii-2026"
    key            = "prod/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "jarvis-terraform-lock"
    encrypt        = true
  }
}
