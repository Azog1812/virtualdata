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
variable "tenant_a_password" {
  type      = string
  sensitive = true
  default   = "AcmeSecure2026!"
}
variable "tenant_b_password" {
  type      = string
  sensitive = true
  default   = "BetaSecure2026!"
}
