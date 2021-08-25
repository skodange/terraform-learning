resource "aws_vpc" "shreehari" {
  cidr_block           = "10.16.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "shreehari"
  }
}

resource "aws_subnet" "shreehari_public1" {
  vpc_id                  = aws_vpc.shreehari.id
  cidr_block              = "10.16.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "shreehari"
  }
}

resource "aws_subnet" "shreehari_public2" {
  vpc_id                  = aws_vpc.shreehari.id
  cidr_block              = "10.16.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "shreehari"
  }
}

resource "aws_subnet" "shreehari_private" {
  vpc_id                  = aws_vpc.shreehari.id
  cidr_block              = "10.16.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "shreehari"
  }
}

resource "aws_internet_gateway" "shreehari-gw" {
  vpc_id = aws_vpc.shreehari.id

  tags = {
    Name = "shreehari"
  }
}

resource "aws_route_table" "shreehari-rt" {
  vpc_id = aws_vpc.shreehari.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.shreehari-gw.id
    }
 
  tags = {
    Name = "shreehari"
  }
}


resource "aws_route_table_association" "shreehari_public1-a" {
  subnet_id      = aws_subnet.shreehari_public1.id
  route_table_id = aws_route_table.shreehari-rt.id
}





