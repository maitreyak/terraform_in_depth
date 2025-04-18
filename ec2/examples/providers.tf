terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

variable "aws_region" {
  default = "us-east-1"
}
variable "aws_profile" {
  default = "adfs"
}