provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = var.iam_role_arn
    session_name = "GitHubRole"
  }
}
