# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
	user_data = file("apache-install.sh")  
  count = terraform.workspace == "default" ? 2 : 1
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}-${count.index}"
  }
}

# resource "aws_instance" "my-demo-vm" {
#   ami = data.aws_ami.amzlinux.id
#   instance_type = var.instance_type
#   tags = {
#     "Name" = "demo-vm1"
#   }
# }




