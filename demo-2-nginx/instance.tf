# resource "aws_key_pair" "ec2_key_new" {
#   key_name = "ec2_key_new"
#   public_key =  "${file("${var.PATH_TO_PUBLIC_KEY}")}"
# }
resource "aws_instance" nginx_example {
  instance_type = "t2.micro"
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  key_name = "ec2_key_new"

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
      command = "echo ${aws_instance.nginx_example.private_ip} >> private_ips.txt"
  }
    connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
output "public_ip" {
    value = "${aws_instance.nginx_example.public_ip}"
}
output "private_ip" {
    value = "${aws_instance.nginx_example.private_ip}"
}