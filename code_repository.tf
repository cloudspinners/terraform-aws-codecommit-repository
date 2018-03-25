resource "aws_codecommit_repository" "service-repository" {
  repository_name = "${var.service}-${var.component}-${var.estate_id}"
  description     = "Reference definition for service ${var.service} of component ${var.component} in estate ${var.estate_id}"
}
