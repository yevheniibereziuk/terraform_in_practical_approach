# Terraform Block
terraform {
  required_version = ">= 1.4" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  # backend "s3" {
  #   bucket = "terraform-bereziuk"
  #   key    = "statecommands/terraform.tfstate"
  #   region = "us-east-1" 
    # For State Locking
    #dynamodb_table = "terraform-dev-state-table"    
    
  # }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on my  local desktop terminal  
$HOME/.aws/credentials
*/
