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

###############################################################
# AWS Provider (US East - CloudFront / CloudWatch)
###############################################################

provider "aws" {

  alias  = "use1"

  region = "us-east-1"

}