variable "tenant_name" {
  type        = string
  description = "Nom du tenant"
}
variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Mot de passe admin du tenant"
}
variable "cpu_quota" {
  type    = number
  default = 4
}
variable "ram_quota" {
  type    = number
  default = 4096
}
variable "vm_quota" {
  type    = number
  default = 5
}
variable "vm_count" {
  type    = number
  default = 0
}
variable "template_id" {
  type = number
}
