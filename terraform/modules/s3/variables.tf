###############################################################
# Variables
###############################################################

variable "bucket_name" {

  description = "S3 Bucket Name"

  type = string

}

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}