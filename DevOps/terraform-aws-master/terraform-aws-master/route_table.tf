resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "terraform-public-rt"
  }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id


  tags = {
    "Name" = "terraform-private-rt"
  }
}


# route associations private
resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.main-private.id
}