#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
echo "<h1>Welcome to Bereziuk ! AWS Infra created using Terraform in us-east-1 Region. Used aws ec2 module.</h1>" | sudo tee /var/www/html/index.html