
resource "aws_iam_group" "committers_group" {
  name = "committers-${var.service}-${var.component}-${var.estate_id}"
}

resource "aws_iam_group_policy" "committer_direct_policies" {
  name = "committer_group_policy-${var.service}-${var.component}-${var.estate_id}"
  group = "${aws_iam_group.committers_group.id}"
  policy = "${data.aws_iam_policy_document.committer.json}"
}

resource "aws_iam_group_policy_attachment" "committer_managed_policy" {
  group      = "${aws_iam_group.committers_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}

data "aws_iam_policy_document" "committer" {
  statement {
    effect = "Allow"
    resources = ["*"]
    actions = [
      "iam:IAMSelfManageServiceSpecificCredentials",
      "iam:IAMReadOnlyAccess"
    ]
  }
}

