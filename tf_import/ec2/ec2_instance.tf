# Create EC2 Instnace Resource
resource "aws_instance" "myec2vm" {
  ami               = "ami-0230bd60aa48260c6"
  #instance_type     = "t2.micro"
  instance_type = "t2.small"
  availability_zone = "us-east-1a"
  key_name          = "ansible_work"
  tags = {
    "Name" = "test-ec2-for-tf-import"
  }
}
