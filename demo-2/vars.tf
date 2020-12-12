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

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}