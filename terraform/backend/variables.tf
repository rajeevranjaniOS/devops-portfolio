###############################################################
# Variables
###############################################################

variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "backend_bucket_name" {

  description = "Terraform Backend S3 Bucket"

  type = string

}

variable "dynamodb_table_name" {

  description = "Terraform Lock Table"

  type = string

}

variable "project_name" {

  description = "Project Name"

  type = string

}

variable "environment" {

  description = "Environment"

  type = string

}