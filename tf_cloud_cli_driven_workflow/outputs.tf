output "website_bucket_arn" {
  description = "ARN of the bucket"
  value = module.s3-website.arn
}

output "website_bucket_name" {
  description = "Name of the bucket"
  value = module.s3-website.name
}

output "website_bucket_domain" {
  description = "domain of the bucket"
  value = module.s3-website.domain
}
output "website_bucket_endpoint" {
  description = "Endpoint  of the bucket"
  value = module.s3-website.endpoint
}