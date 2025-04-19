variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "adfs"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "instance_count" {
  type = number
}


