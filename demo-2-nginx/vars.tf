variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "AMIS" {
  type = "map"
  default = {
    ap-northeast-2 = "ami-f030989e"
    ap-south-1 = "ami-41e9c52e"
    ap-northeast-1 = "ami-48a45937"
  }
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "ec2_key_new"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "ec2_key_new.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
