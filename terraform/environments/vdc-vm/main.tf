terraform {
  required_version = ">= 1.6.0"

  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
    }
  }
}

provider "opennebula" {
  endpoint = var.one_endpoint
  username = var.one_username
  password = var.one_password
}

module "vm_web_01" {
  source      = "../../modules/vdc-vm"
  name        = "vm-web-01"
  template_id = var.template_id
}

module "vm_web_02" {
  source      = "../../modules/vdc-vm"
  name        = "vm-web-02"
  template_id = var.template_id
}
