terraform {
  # required_version = "~> 1.9.3"
  required_version = "~> 1.9, < 2.0"  # Allows versions >= 1.9 and < 2.0  
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "shabbir-bucket-for-devecops2"
    region         = "us-east-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}
