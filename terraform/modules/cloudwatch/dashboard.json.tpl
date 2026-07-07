{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "title": "CloudFront Requests",
        "view": "timeSeries",
        "stacked": false,
        "region": "us-east-1",
        "stat": "Sum",
        "period": 300,
        "metrics": [
          [
            "AWS/CloudFront",
            "Requests",
            "DistributionId",
            "${distribution_id}",
            "Region",
            "Global"
          ]
        ]
      }
    },

    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "title": "4xx Error Rate",
        "view": "timeSeries",
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "metrics": [
          [
            "AWS/CloudFront",
            "4xxErrorRate",
            "DistributionId",
            "${distribution_id}",
            "Region",
            "Global"
          ]
        ]
      }
    },

    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "title": "5xx Error Rate",
        "view": "timeSeries",
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "metrics": [
          [
            "AWS/CloudFront",
            "5xxErrorRate",
            "DistributionId",
            "${distribution_id}",
            "Region",
            "Global"
          ]
        ]
      }
    },

    {
      "type": "metric",
      "x": 12,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "title": "Bytes Downloaded",
        "view": "timeSeries",
        "region": "us-east-1",
        "stat": "Sum",
        "period": 300,
        "metrics": [
          [
            "AWS/CloudFront",
            "BytesDownloaded",
            "DistributionId",
            "${distribution_id}",
            "Region",
            "Global"
          ]
        ]
      }
    }
  ]
}