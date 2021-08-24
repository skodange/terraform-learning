variable "AWS_ACCESS_KEY" {
  
}

variable "AWS_SECRET_KEY" {
  
}

variable "AWS_REGION" {
  default = "us-east-2" 
}

variable "AMIS" {
  type = map(string)
  default = {
      us-east-2 = "ami-0279406e0655775be"
  }
}