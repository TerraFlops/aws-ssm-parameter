resource "aws_ssm_parameter" "ssm_parameter" {
  count = var.ignore_value_changes == false ? 1 : 0
    allowed_pattern = ""
  description = ""
  name = var.name
  type = var.secure ? "SecureString": "String"
  value = var.value
  tier = var.tier
  overwrite = true
}

resource "aws_ssm_parameter" "ssm_parameter_ignore_changes" {
  count = var.ignore_value_changes == true ? 1 : 0
  allowed_pattern = ""
  description = ""
  name = var.name
  type = var.secure ? "SecureString": "String"
  value = var.value
  tier = var.tier
  overwrite = true
  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
