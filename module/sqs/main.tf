resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.sqs_name
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  # redrive_policy = jsonencode({
  #   deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #   maxReceiveCount     = 4
  # })

  tags = {
    Environment = "dev"
  }
}

# resource "aws_sqs_queue" "terraform_queue_deadletter" {
#   name = "${var.sqs_name}-deadletter-queue"
#   redrive_allow_policy = jsonencode({
#     redrivePermission = "byQueue",
#     sourceQueueArns   = [aws_sqs_queue.terraform_queue.arn]
#   })
# }