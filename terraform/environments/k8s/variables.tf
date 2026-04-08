variable "one_endpoint" {
  type = string
}

variable "one_username" {
  type = string
}

variable "one_password" {
  type      = string
  sensitive = true
}

variable "k8s_template_id" {
  type = number
}
