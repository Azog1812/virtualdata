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

variable "template_id" {
  type = number
}

variable "ssh_public_key" {
  type = string
}
