variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-southeast-1"
}

//https://cloud-images.ubuntu.com/locator/
variable "AMIS" {
  type = map
  default = {
    "ap-southeast-1" = "ami-05857eb85d92dda0e"
  }
}