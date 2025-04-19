data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default"{
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
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