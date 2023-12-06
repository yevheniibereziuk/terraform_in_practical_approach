# Create EC2 Instance - Amazon Linux
resource "random_id" "id" {
  byte_length = 8
}
resource "aws_instance" "my-ec2-vm" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  key_name               = "second-terraform-key"
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  # Dynamic expressions
  tags              = local.common_tags
  availability_zone = var.availability_zones[count.index]
  count             = (var.high_availability == true ? 2 : 1)


}



