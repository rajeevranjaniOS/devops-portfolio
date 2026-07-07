###############################################################
# CloudWatch Dashboard
###############################################################

resource "aws_cloudwatch_dashboard" "portfolio" {

  dashboard_name = var.dashboard_name

  dashboard_body = templatefile("${path.module}/dashboard.json.tpl", {

    distribution_id = var.distribution_id

  })

}

###############################################################
# CloudFront 4xx Alarm
###############################################################

resource "aws_cloudwatch_metric_alarm" "error_4xx" {

  alarm_name          = var.alarm_4xx_name

  alarm_description   = "Alarm when CloudFront 4xx error rate exceeds threshold"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods  = 1

  metric_name         = "4xxErrorRate"

  namespace           = "AWS/CloudFront"

  period              = 300

  statistic           = "Average"

  threshold           = 1

  treat_missing_data  = "notBreaching"

  dimensions = {

    DistributionId = var.distribution_id

    Region         = "Global"

  }

  alarm_actions = [

    var.sns_topic_arn

  ]

}

###############################################################
# CloudFront 5xx Alarm
###############################################################

resource "aws_cloudwatch_metric_alarm" "error_5xx" {

  alarm_name          = var.alarm_5xx_name

  alarm_description   = "Alarm when CloudFront 5xx error rate exceeds threshold"

  comparison_operator = "GreaterThanThreshold"

  metric_name         = "5xxErrorRate"

  namespace           = "AWS/CloudFront"

  period              = 300

  evaluation_periods = var.evaluation_periods

  threshold = var.alarm_threshold

  statistic           = "Average"

  treat_missing_data  = "notBreaching"

  dimensions = {

    DistributionId = var.distribution_id

    Region         = "Global"

  }

  alarm_actions = [

    var.sns_topic_arn

  ]

}