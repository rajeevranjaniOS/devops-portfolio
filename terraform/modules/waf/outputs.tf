###############################################################
# Outputs
###############################################################



output "web_acl_id" {

  value = aws_wafv2_web_acl.portfolio.id

}

###############################################################
# WAF ARN
###############################################################

output "web_acl_arn" {

  description = "AWS WAF Web ACL ARN"

  value = aws_wafv2_web_acl.portfolio.arn

}