###############################################################
# CloudFront Origin Access Control
###############################################################

resource "aws_cloudfront_origin_access_control" "portfolio_oac" {

  name = "${var.project_name}-oac"

  description = "Origin Access Control for Portfolio Website"

  origin_access_control_origin_type = "s3"

  signing_behavior = "always"

  signing_protocol = "sigv4"

}

###############################################################
# CloudFront Distribution
###############################################################

resource "aws_cloudfront_distribution" "portfolio_distribution" {

  enabled = true

  is_ipv6_enabled = true

  default_root_object = "index.html"

  web_acl_id = var.web_acl_arn

  # Cost Optimization
  price_class = "PriceClass_200"

  origin {

    domain_name = var.bucket_regional_domain_name

    origin_id = "portfolio-s3-origin"

    origin_access_control_id = aws_cloudfront_origin_access_control.portfolio_oac.id

  }

  default_cache_behavior {

    allowed_methods = ["GET", "HEAD"]

    cached_methods = ["GET", "HEAD"]

    target_origin_id = "portfolio-s3-origin"

    viewer_protocol_policy = "redirect-to-https"

    compress = true

    forwarded_values {

      query_string = false

      cookies {

        forward = "none"

      }

    }

  }

  restrictions {

    geo_restriction {

      restriction_type = "none"

    }

  }

  viewer_certificate {

  cloudfront_default_certificate = true

  minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = var.common_tags

}

###############################################################
# Bucket Policy
###############################################################

resource "aws_s3_bucket_policy" "portfolio_policy" {

  bucket = var.bucket_id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "AllowCloudFrontServicePrincipal"

        Effect = "Allow"

        Principal = {

          Service = "cloudfront.amazonaws.com"

        }

        Action = "s3:GetObject"

        Resource = "${var.bucket_arn}/*"

        Condition = {

          StringEquals = {

            "AWS:SourceArn" = aws_cloudfront_distribution.portfolio_distribution.arn

          }

        }

      }

    ]

  })

}