output "aws_instance_arn" {
  value = aws_instance.ec2[*].arn
}

output "aws_instance_ip" {
  value = aws_instance.ec2[*].private_ip
}

output "aws_instance" {
  value = aws_instance.ec2
}

output "aws_instance_iam_role" {
  value = aws_iam_role.main
}

output "aws_iam_instance_profile" {
  value = aws_iam_instance_profile.main
}