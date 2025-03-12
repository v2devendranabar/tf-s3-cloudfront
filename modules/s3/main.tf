resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.project_name}-bucket"
}

resource "aws_s3_ownership_controls" "owner_bucket" {
  bucket = aws_s3_bucket.website_bucket.id

  rule {
   object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "policy_s3" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.website_bucket.arn}/*"
    }
  ]
}
EOF
}
