module "s3-website" {
  source  = "app.terraform.io/terraform_study_purpose/s3-website/aws"
  version = "1.0.2"
  # insert required variables here
  bucket_name = var.bucket_name
  bucket_tags  = var.bucket_tags
}