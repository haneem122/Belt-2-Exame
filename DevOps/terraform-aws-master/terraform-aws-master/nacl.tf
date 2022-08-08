resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [aws_subnet.public_subnet.id]

  tags = {
    "Name" = "nacl_public"
  }
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [aws_subnet.private_subnet.id]
  tags = {
    "Name" = "nacl_private"
  }
}

resource "aws_network_acl_rule" "public_nacl_rule1" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_nacl_rule2" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 110
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}


resource "aws_network_acl_rule" "public_outbound_nacl_rule1" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_nacl_rule2" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 110
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = aws_vpc.main.cidr_block
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "private_outbound_nacl_rule1" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

