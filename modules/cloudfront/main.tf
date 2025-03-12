resource "aws_cloudfront_distribution" "cfd" {
  origin {
    domain_name = "${var.bucket_name}.s3.amazonaws.com"
    origin_id = "S3-${var.s3_bucket_name}"
  }
  enabled = true
}
