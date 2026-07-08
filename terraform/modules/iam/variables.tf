###############################################################
# IAM Role Name
###############################################################

variable "role_name" {

  description = "IAM Role Name"

  type = string

}

###############################################################
# IAM Policy Name
###############################################################

variable "policy_name" {

  description = "IAM Policy Name"

  type = string

}

###############################################################
# Portfolio Bucket ARN
###############################################################

variable "bucket_arn" {

  description = "Portfolio Bucket ARN"

  type = string

}

###############################################################
# Common Tags
###############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}