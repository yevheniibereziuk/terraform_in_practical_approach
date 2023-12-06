# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = var.instance_type
  key_name = "second-terraform-key"
  #user_data = file("apache-install.sh")  commented with file function
  user_data              = templatefile("user_data.tmpl", { package_name = var.package_name }) #use templatefile function
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name"   = "amz-linux-vm"
    "target" = "Target-Test-1"
  }
}



