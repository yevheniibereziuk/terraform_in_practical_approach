module "web_s3_bucket" {
  source = "../parent_module"
  bucket_name = var.bucket_name
  bucket_tags  = var.bucket_tags
}