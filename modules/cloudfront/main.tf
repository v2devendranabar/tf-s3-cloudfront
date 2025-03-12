resource "aws_cloudfront_distribution" "cfd" {
  origin {
    domain_name = "${var.s3_bucket_name}.s3.amazonaws.com"
    origin_id   = "S3-${var.s3_bucket_name}"
  }

  enabled = true

  # Required: Default cache behavior
  default_cache_behavior {
    target_origin_id       = "S3-${var.s3_bucket_name}"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  # Required: Viewer certificate (for HTTPS)
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # Required: Restrictions (geo-blocking settings)
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
