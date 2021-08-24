terraform {
  backend "s3" {
    bucket = "terraform-shreehari"
    key    = "terraform/statefile"
  }
}