resource "aws_instance" "public_ec2" {
  ami           = var.ami-image
  instance_type = var.instance_type

  associate_public_ip_address = true

  # the VPC subnet
  subnet_id = aws_subnet.public_subnet.id

  # the security group
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  # the public SSH key
  key_name = aws_key_pair.deployer.key_name

  tags = {
    "Name" = "public_ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami           = var.ami-image
  instance_type = var.instance_type

  # the VPC subnet
  subnet_id = aws_subnet.private_subnet.id

  # the security group
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  # the public SSH key
  key_name = aws_key_pair.deployer.key_name

  tags = {
    "Name" = "private_ec2"
  }
}