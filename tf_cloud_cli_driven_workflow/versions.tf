# Terraform Block
terraform {
  required_version = ">= 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  cloud {
    organization = "terraform_study_purpose"

    workspaces {
      name = "cli-driven-test"
    }
  }
}


# Provider Block
provider "aws" {
  region  = var.aws_region
}
