resource "aws_ssm_parameter" "ssm_parameter" {
  count = var.ignore_value_changes == false ? 1 : 0
  name = var.name
  type = var.secure ? "SecureString": "String"
  value = var.value
  overwrite = true
}

resource "aws_ssm_parameter" "ssm_parameter_ignore_changes" {
  count = var.ignore_value_changes == true ? 1 : 0
  name = var.name
  type = var.secure ? "SecureString": "String"
  value = var.value
  overwrite = true
  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
