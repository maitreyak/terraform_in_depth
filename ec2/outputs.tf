output "aws_instance_arn" {
  value = aws_instance.ec2[*].arn
}

output "aws_instance_ip" {
  value = aws_instance.ec2[*].private_ip
}

output "aws_instance" {
  value = aws_instance.ec2
}