###############################################################
# Variables
###############################################################

variable "topic_name" {

  description = "SNS Topic Name"

  type = string

}

variable "email_endpoint" {

  description = "Email address for SNS subscription"

  type = string

}

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

}