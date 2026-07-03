###############################################################
# AWS Provider Configuration
###############################################################

provider "aws" {

  region = var.aws_region

  default_tags {

    tags = {

      Project = "Online-Portfolio"

      Environment = var.environment

      ManagedBy = "Terraform"

      Owner = "Rajeev Ranjan"

    }

  }

}