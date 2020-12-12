variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-05857eb85d92dda0e"
  instance_type = "t2.micro"
}

