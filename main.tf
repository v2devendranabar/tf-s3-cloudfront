module "s3" {
  source = "./modules/s3"
  project_name = var.project_name
}

module "cloudfront" {
  source = "./modules/cloudfront"
  s3_bucket_name = module.s3.bucket_name
}
