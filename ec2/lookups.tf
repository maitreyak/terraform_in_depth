data "aws_vpc" "default" {
  id = "vpc-07f03b51c083e364a"
}

data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  most_recent = true

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }
}

data "aws_subnets" "default"{
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  tags = {
    Name = "project-subnet-public1-us-east-1a"
  }
}

output "aws_subnets" {
  value = data.aws_subnets.default
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }
  }
}

data "aws_iam_policy" "ssm_arn" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
}