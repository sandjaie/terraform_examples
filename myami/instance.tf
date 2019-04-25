resource "aws_instance" demo_example {
  instance_type = "t2.micro"
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  key_name = "ec2-terf"
  vpc_security_group_ids = ["${aws_security_group.allow_from_home.id}"]

    provisioner "file" {
      source = "install_script.sh"
      destination = "/tmp/install_script.sh"
  }
    provisioner "remote-exec" {
       inline = [
           "chmod +x /tmp/install_script.sh",
           "sudo /tmp/install_script.sh"
       ]
   }
    provisioner "local-exec" {
      command = "echo ${aws_instance.demo_example.private_ip} >> private_ips.txt"
  }
    connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
resource "aws_security_group" "allow_from_home" {
  name        = "allow_from_home"
  description = "Allow all inbound traffic from home"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${var.MY_PUBLIC_IP}"]
  }

  tags {
    Name = "allow_from_home"
  }
}
output "public_ip" {
    value = "${aws_instance.demo_example.public_ip}"
}
output "private_ip" {
    value = "${aws_instance.demo_example.private_ip}"
}
