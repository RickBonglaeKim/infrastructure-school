
resource "aws_sqs_queue" "school-ai" {
  name = replace(local.school-ai-name, ".", "")
  fifo_queue = false
}

data "aws_iam_policy_document" "school-ai" {
  statement {
    principals {
      type = "AWS"
      identifiers = var.iam-arn
    }
    effect = "Allow"
    actions = local.sqs-policy-actions
    resources = [
      aws_sqs_queue.school-ai.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "school-ai" {
  queue_url = aws_sqs_queue.school-ai.url
  policy = data.aws_iam_policy_document.school-ai.json
}