terraform {
  backend "s3" {
    bucket = "terraform-state-f970e2767d0cfe75876ea857f92e319b"
    key = "terraform/demo4"
    region = "ap-southeast-1"
  }
}