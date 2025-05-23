resource "aws_instance" "ec2" {
  ami = data.aws_ami.ubuntu.id
  subnet_id = data.aws_subnets.default.ids[0]
  instance_type = var.instance_type
  count = var.instance_count
  tags = merge(var.tags, { Name="${var.name_prefix}-instance"})
  iam_instance_profile = aws_iam_instance_profile.main.name
}

resource "aws_iam_role" "main" {
  name =  "${var.name_prefix}-instance-role"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

resource "aws_iam_instance_profile" "main" {
  name = aws_iam_role.main.name
  role = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "main" {
  policy_arn = data.aws_iam_policy.ssm_arn.arn
  role       = aws_iam_role.main.name
}