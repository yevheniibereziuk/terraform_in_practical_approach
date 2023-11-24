output "website_bucket_arn" {
  description = "ARN of the bucket"
  value = module.web_s3_bucket.arn
}

output "website_bucket_name" {
  description = "Name of the bucket"
  value = module.web_s3_bucket.name
}

output "website_bucket_domain" {
  description = "domain of the bucket"
  value = module.web_s3_bucket.domain
}
output "website_bucket_endpoint" {
  description = "Endpoint  of the bucket"
  value = module.web_s3_bucket.endpoint
}