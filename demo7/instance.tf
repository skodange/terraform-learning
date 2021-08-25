resource "aws_instance" "tfshreehari" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.shreehari_public1.id
  vpc_security_group_ids = [aws_security_group.shreehari-sg.id]
  key_name               = aws_key_pair.mykey_shreehari.key_name
}

resource "aws_ebs_volume" "ebs-v1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "shreehari"
  }
}

resource "aws_volume_attachment" "ebs-v1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-v1.id
  instance_id = aws_instance.tfshreehari.id
}