###############################################################
# AWS WAF Web ACL
###############################################################

resource "aws_wafv2_web_acl" "portfolio" {

  name  = var.web_acl_name

  scope = "CLOUDFRONT"

  ###############################################################
  # Default Action
  ###############################################################

  default_action {

    allow {}

  }

  ###############################################################
  # AWS Managed Rule - Amazon IP Reputation List
  ###############################################################

  rule {

    name     = "AWSManagedRulesAmazonIpReputationList"

    priority = 0

    override_action {

      none {}

    }

    statement {

      managed_rule_group_statement {

        vendor_name = "AWS"

        name        = "AWSManagedRulesAmazonIpReputationList"

      }

    }

    visibility_config {

      cloudwatch_metrics_enabled = true

      metric_name                = "AWSManagedRulesAmazonIpReputationList"

      sampled_requests_enabled   = true

    }

  }

###############################################################
# AWS Managed Rule - Anonymous IP List
###############################################################

  rule {

    name     = "AWSManagedRulesAnonymousIpList"

    priority = 1

    override_action {

      none {}

    }

    statement {

      managed_rule_group_statement {

        vendor_name = "AWS"

        name        = "AWSManagedRulesAnonymousIpList"

      }

    }

    visibility_config {

      cloudwatch_metrics_enabled = true

      metric_name                = "AWSManagedRulesAnonymousIpList"

      sampled_requests_enabled   = true

    }

  }

  ###############################################################
# AWS Managed Rule - Common Rule Set
###############################################################

rule {

  name     = "AWSManagedRulesCommonRuleSet"

  priority = 2

  override_action {

    none {}

  }

  statement {

    managed_rule_group_statement {

      vendor_name = "AWS"

      name        = "AWSManagedRulesCommonRuleSet"

    }

  }

  visibility_config {

    cloudwatch_metrics_enabled = true

    metric_name                = "AWSManagedRulesCommonRuleSet"

    sampled_requests_enabled   = true

  }

}



  ###############################################################
  # Visibility Configuration
  ###############################################################

  visibility_config {

    cloudwatch_metrics_enabled = true

    metric_name                = var.web_acl_name

    sampled_requests_enabled   = true

  }

  ###############################################################
  # Tags
  ###############################################################

  tags = var.common_tags

}

