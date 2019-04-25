variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "AMIS" {
  type = "map"
  default = {
    ap-south-1 = "ami-0a6935ee481a8d0c0"
  }
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "/Users/sandjaier/terraform/ec2-terf.pem"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
variable "MY_PUBLIC_IP" {
  default = "49.206.120.50/32"
}
