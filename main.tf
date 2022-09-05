module "fanout" {
    source = "./module/sns_fanout"
    subscription = false
    sns_name = "fanout-order"
    endpoint_arn = module.sqs.endpoint_arn
    map_endpoint = [
        {
            "endpoint":"arn:aws:sqs:us-east-1:500701125918:sqs_1",
            "filter":"sqs-1-victor"
        },
        {
            "endpoint":"arn:aws:sqs:us-east-1:500701125918:sqs_2",
            "filter":"sqs-2-victor"
        }
    ]
}

module "sqs" {
    source = "./module/sqs"
    sqs_name = "order"
}