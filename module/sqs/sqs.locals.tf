locals {

  school-ai-name = "${var.prefix}-ai-${var.environment}"
  
  sqs-policy-actions = [
    "SQS:GetQueueAttributes",
    "SQS:GetQueueUrl",
    "SQS:ReceiveMessage",
    "SQS:ChangeMessageVisibility",
    "SQS:SetQueueAttributes",
    "SQS:SendMessage",
    "SQS:DeleteMessage"
  ]

}