data "aws_vpc" "default" {
  default = true
}


data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "test_instance" {
  source    = "../"
  subnet_id = data.aws_subnets.default.ids[0]
  name_prefix = "mait"
  instance_count = 1
  tags = {"BillingGroup" = "mait-ec2"}
}

output "aws_instance_arn" {
  value = module.test_instance.aws_instance_arn
}

output "aws_instance_ip" {
  value = module.test_instance.aws_instance_ip
}

output "aws_instance_role" {
  value = module.test_instance.aws_instance_iam_role
}

output "aws_instance_profile_role" {
  value = module.test_instance.aws_iam_instance_profile
}