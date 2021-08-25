resource "aws_key_pair" "mykey_shreehari" {
  key_name   = "mykey_shreehari"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}