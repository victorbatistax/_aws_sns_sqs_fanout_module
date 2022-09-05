output "endpoint_arn"{
    value = aws_sqs_queue.terraform_queue.arn
}