resource "aws_instance" "ec2" {
  ami = data.aws_ami.ubuntu.id
  subnet_id = data.aws_subnets.default.ids[0]
  instance_type = var.instance_type
  count = var.instance_count
  tags = merge(var.tags, { Name="${var.name_prefix}-instance"})
}