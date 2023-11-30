# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  count = 2
  instance_type = var.instance_type
	user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "amz-linux-vm"
    "target" = "Target-Test-1"
  }
}




