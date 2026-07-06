###############################################################
# Variables
###############################################################

variable "project_name" {

  description = "Project Name"

  type = string

}

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}

variable "bucket_id" {

  description = "S3 Bucket ID"

  type = string

}

variable "bucket_arn" {

  description = "S3 Bucket ARN"

  type = string

}

variable "bucket_regional_domain_name" {

  description = "S3 Regional Domain Name"

  type = string

}