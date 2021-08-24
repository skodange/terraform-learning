resource "aws_instance" "shreehari" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}