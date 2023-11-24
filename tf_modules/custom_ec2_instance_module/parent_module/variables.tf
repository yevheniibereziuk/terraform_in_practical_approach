# Input Variables

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of s3 bucket"
  type        = string
}

variable "bucket_tags" {
  description = "Tages to set on the buckets"
  type        = map(string)
  default     = {}
}