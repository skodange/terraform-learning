
resource "aws_instance" "tfshreehari" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}

output "ip" {
    value = aws_instance.tfshreehari.public_ip
}
