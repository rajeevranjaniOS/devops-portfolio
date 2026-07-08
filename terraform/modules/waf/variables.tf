###############################################################
# WAF Variables
###############################################################

variable "web_acl_name" {

  description = "AWS WAF Web ACL Name"

  type = string

}

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}