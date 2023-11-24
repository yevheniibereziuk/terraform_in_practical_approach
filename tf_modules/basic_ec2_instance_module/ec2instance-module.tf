# AWS EC2 Instance Module
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-modules-demo"
  instance_count = 1

  ami                    = "ami-0230bd60aa48260c6"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-09015c4ccab83f4d1"]   # Get Default VPC Security Group ID and replace
  subnet_id              = "subnet-01d93429dc2ac0583" # Get one public subnet id from default vpc and replace
  user_data              = file("apache-install.sh")

  tags = {
    Name        = "Modules-Demo"
    Terraform   = "true"
    Environment = "dev"
  }
}

