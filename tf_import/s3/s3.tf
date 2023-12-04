resource "aws_s3_bucket" "s3_bucket" {
  bucket = "tests-bucket-for-tf-import"
  force_destroy = false

}

#terraform import aws_s3_bucket.s3_bucket tests-bucket-for-tf-import