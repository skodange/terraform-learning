resource "aws_security_group" "shreehari-sg" {
  name        = "shreehari-sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.shreehari.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "shreehari"
  }
}