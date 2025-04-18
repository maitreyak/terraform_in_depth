variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "adfs"
}

variable "instance_type" {
  type = string
  default = "t4g.micro"
}

variable "subnet_id" {
  type = string
}

