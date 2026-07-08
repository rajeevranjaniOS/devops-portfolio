###############################################################
# IAM Policy - Portfolio S3 Read Only
###############################################################

resource "aws_iam_policy" "portfolio_s3_readonly" {

  name = var.policy_name

  description = "Read-only access to Portfolio S3 Bucket"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "ListPortfolioBucket"

        Effect = "Allow"

        Action = [

          "s3:ListBucket"

        ]

        Resource = [

          var.bucket_arn

        ]

      },

      {

        Sid = "ReadPortfolioObjects"

        Effect = "Allow"

        Action = [

          "s3:GetObject"

        ]

        Resource = [

          "${var.bucket_arn}/*"

        ]

      }

    ]

  })

  tags = var.common_tags

}

###############################################################
# IAM Role
###############################################################

resource "aws_iam_role" "portfolio_ec2_role" {

  name = var.role_name

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

  tags = var.common_tags

}
###############################################################
# Attach IAM Policy to IAM Role
###############################################################

resource "aws_iam_role_policy_attachment" "portfolio_s3_readonly" {

  role = aws_iam_role.portfolio_ec2_role.name

  policy_arn = aws_iam_policy.portfolio_s3_readonly.arn

}

###############################################################
# IAM Instance Profile
###############################################################

resource "aws_iam_instance_profile" "portfolio" {

  name = "${var.role_name}-profile"

  role = aws_iam_role.portfolio_ec2_role.name

}