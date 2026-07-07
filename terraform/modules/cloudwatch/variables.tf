###############################################################
# Variables
###############################################################

variable "dashboard_name" {

  description = "CloudWatch Dashboard Name"

  type = string

}

variable "distribution_id" {

  description = "CloudFront Distribution ID"

  type = string

}

variable "sns_topic_arn" {

  description = "SNS Topic ARN"

  type = string

}

variable "alarm_4xx_name" {

  description = "4xx Alarm Name"

  type = string

}

variable "alarm_5xx_name" {

  description = "5xx Alarm Name"

  type = string

}
###############################################################
# Alarm Threshold
###############################################################

variable "alarm_threshold" {

  description = "CloudWatch alarm threshold"

  type = number

  default = 1

}

###############################################################
# Evaluation Periods
###############################################################

variable "evaluation_periods" {

  description = "Number of evaluation periods"

  type = number

  default = 1

}