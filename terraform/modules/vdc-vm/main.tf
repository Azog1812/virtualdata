terraform {
  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
    }
  }
}

resource "opennebula_virtual_machine" "this" {
  name        = var.name
  template_id = var.template_id
}

