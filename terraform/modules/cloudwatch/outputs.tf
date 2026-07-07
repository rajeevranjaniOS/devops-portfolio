###############################################################
# Outputs
###############################################################

output "dashboard_name" {

  value = aws_cloudwatch_dashboard.portfolio.dashboard_name

}

output "alarm_4xx_name" {

  value = aws_cloudwatch_metric_alarm.error_4xx.alarm_name

}

output "alarm_5xx_name" {

  value = aws_cloudwatch_metric_alarm.error_5xx.alarm_name

}