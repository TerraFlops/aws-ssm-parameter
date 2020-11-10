variable "name" {
  description = "The name of the parameter to be created0"
  type = string
}

variable "value" {
  description = "The value to store in the parameter"
  type = string
}

variable "secure" {
  description = "Boolean flag, if true will store the values as encrypted secure strings"
  type = bool
  default = false
}

variable "ignore_value_changes" {
  description = "Boolean flag, if true the values will not be rewritten automatically after direct updates in AWS"
  type = bool
  default = false
}

variable "tier" {
  type = string
  default = "Standard"
}