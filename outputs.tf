
output "checkout_policy_arn" {
  description = "ARN for the policy that allows checkouts"
  value = "${aws_iam_policy.pipeline_checkout_policy.arn}"
}

output "committer_group_name" {
  description = "Name of the IAM group for users with commit access"
  value = "${aws_iam_group.committers_group.name}"
}

output "clone_url_ssh" {
  description = "URL for cloning the repository with SSH"
  value = "${aws_codecommit_repository.service-repository.clone_url_ssh}"
}
