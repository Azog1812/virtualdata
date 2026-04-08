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

resource "opennebula_virtual_machine" "vm_test" {
  name        = "tf-vm-test-01"
  template_id = var.template_id
}
