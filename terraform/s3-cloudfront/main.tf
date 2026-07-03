###############################################################
# S3 Bucket
###############################################################

resource "aws_s3_bucket" "portfolio_bucket" {

  bucket = var.bucket_name

  tags = local.common_tags

}
###############################################################
# Bucket Ownership Controls
###############################################################

resource "aws_s3_bucket_ownership_controls" "portfolio" {

  bucket = aws_s3_bucket.portfolio_bucket.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}
###############################################################
# Block Public Access
###############################################################

resource "aws_s3_bucket_public_access_block" "portfolio" {

  bucket = aws_s3_bucket.portfolio_bucket.id

  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}
###############################################################
# Bucket Versioning
###############################################################

resource "aws_s3_bucket_versioning" "portfolio" {

  bucket = aws_s3_bucket.portfolio_bucket.id

  versioning_configuration {

    status = "Enabled"

  }

}
###############################################################
# CloudFront Origin Access Control
###############################################################

resource "aws_cloudfront_origin_access_control" "portfolio_oac" {

  name                              = "${var.project_name}-oac"

  description                       = "Origin Access Control for Portfolio Website"

  origin_access_control_origin_type = "s3"

  signing_behavior                  = "always"

  signing_protocol                  = "sigv4"

}
###############################################################
# CloudFront Distribution
###############################################################

resource "aws_cloudfront_distribution" "portfolio_distribution" {

  enabled             = true

  is_ipv6_enabled     = true

  default_root_object = "index.html"

    # Cost Optimization
  price_class         = "PriceClass_200"

  origin {

    domain_name              = aws_s3_bucket.portfolio_bucket.bucket_regional_domain_name

    origin_id                = "portfolio-s3-origin"

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

  }

  tags = local.common_tags

}
###############################################################
# Bucket Policy
###############################################################

resource "aws_s3_bucket_policy" "portfolio_policy" {

  bucket = aws_s3_bucket.portfolio_bucket.id

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

        Resource = "${aws_s3_bucket.portfolio_bucket.arn}/*"

        Condition = {

          StringEquals = {

            "AWS:SourceArn" = aws_cloudfront_distribution.portfolio_distribution.arn

          }

        }

      }

    ]

  })

}