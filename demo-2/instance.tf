# resource "aws_key_pair" "ec2_key_new" {
#   key_name = "ec2_key_new"
#   public_key =  "${file("${var.PATH_TO_PUBLIC_KEY}")}"
# }
resource "aws_instance" "tail_example" {
  instance_type = "t2.micro"
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  #key_name = "${aws_key_pair.ec2_key_new.key_name}" #Use this first time to provision the keys
  key_name = "ec2_key_new"
  provisioner "file" {
      source = "install_script.sh"
      destination = "/tmp/install_script.sh"
  }
    provisioner "file" {
      source = "after_install.sh"
      destination = "/tmp/after_install.sh"
  }
   provisioner "remote-exec" {
       inline = [
           "chmod +x /tmp/install_script.sh",
           "sudo /tmp/install_script.sh"
       ]
   }
  provisioner "file" {
      source = "config.yaml"
      destination = "/etc/tailon/config.yaml"
  }
    provisioner "file" {
      source = "tailon-supervisor.conf"
      destination = "/etc/supervisor/conf.d/tailon-supervisor.conf"
  }
  provisioner "remote-exec" {
      inline = [
          "chmod +x /tmp/after_script.sh",
          "sudo /tmp/after_install.sh"
      ]
  }
    connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}