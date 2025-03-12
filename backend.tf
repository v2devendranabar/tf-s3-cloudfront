terraform {
  backend "s3" {
    bucket = "terraform-state-120325-v2-dn"
    key = "tf-s3-cloudfront/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-120325-v2-dn"
    encrypt = true
  }
}
