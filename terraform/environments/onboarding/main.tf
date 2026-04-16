terraform {
  required_version = ">= 1.6.0"
  required_providers {
    opennebula = {
      source  = "OpenNebula/opennebula"
      version = "~> 1.4"
    }
  }
}
provider "opennebula" {
  endpoint = var.one_endpoint
  username = var.one_username
  password = var.one_password
}
module "tenant_a" {
  source         = "../../modules/vdc-tenant"
  tenant_name    = "acme-corp"
  admin_password = var.tenant_a_password
  cpu_quota      = 4
  ram_quota      = 4096
  vm_quota       = 5
  vm_count       = 0
  template_id    = var.template_id
}
module "tenant_b" {
  source         = "../../modules/vdc-tenant"
  tenant_name    = "beta-labs"
  admin_password = var.tenant_b_password
  cpu_quota      = 2
  ram_quota      = 2048
  vm_quota       = 3
  vm_count       = 0
  template_id    = var.template_id
}
