//Always check Free Tier in all the regions
variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}
variable "REGION" {
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
