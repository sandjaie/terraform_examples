resource "aws_instance" "first_instance" {
  instance_type = "t2.micro"
  ami = "${lookup(var.AMIS, var.REGION)}"
}
