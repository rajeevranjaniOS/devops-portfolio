###############################################################
# Outputs
###############################################################

output "topic_arn" {

  description = "SNS Topic ARN"

  value = aws_sns_topic.portfolio_alerts.arn

}

output "topic_name" {

  description = "SNS Topic Name"

  value = aws_sns_topic.portfolio_alerts.name

}