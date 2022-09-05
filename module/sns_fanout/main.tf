resource "aws_sns_topic" "sns_terraform" {
  name = var.sns_name
}

resource "aws_sns_topic_subscription" "sqs_target" {
  count = var.subscription == true ? length(var.map_endpoint) : 0
  topic_arn = aws_sns_topic.sns_terraform.arn
  protocol  = "sqs"
  endpoint  = var.map_endpoint[count.index].endpoint
  # filter_policy = file("${path.module}/filtering/fila_sqs_filter.json")
  filter_policy =  jsonencode({ 
    "id_sqs" = ["${var.map_endpoint[count.index].filter}"]
    })
}

#https://docs.aws.amazon.com/sns/latest/dg/string-value-matching.html