###############################################################
# SNS Topic
###############################################################

resource "aws_sns_topic" "portfolio_alerts" {

  name = var.topic_name

  tags = var.common_tags

}

###############################################################
# Email Subscription
###############################################################

resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.portfolio_alerts.arn

  protocol = "email"

  endpoint = var.email_endpoint

}