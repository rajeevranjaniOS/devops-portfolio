###############################################################
# Terraform Remote Backend
###############################################################

terraform {

  backend "s3" {

    bucket         = "rajeevranjan-tf-state-2026"

    key            = "s3-cloudfront/terraform.tfstate"

    region         = "ap-south-1"

    dynamodb_table = "terraform-state-lock"

    encrypt        = true

  }

}