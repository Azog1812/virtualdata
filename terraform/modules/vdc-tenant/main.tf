terraform {
  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
    }
  }
}
resource "opennebula_group" "tenant" {
  name = var.tenant_name
  quotas {
    vm_quotas {
      cpu            = var.cpu_quota
      memory         = var.ram_quota
      running_cpu    = var.cpu_quota
      running_memory = var.ram_quota
      running_vms    = var.vm_quota
      vms            = var.vm_quota
    }
  }
}
resource "opennebula_user" "admin" {
  name          = "${var.tenant_name}-admin"
  password      = var.admin_password
  auth_driver   = "core"
  primary_group = opennebula_group.tenant.id
}
resource "opennebula_virtual_data_center" "vdc" {
  name      = "${var.tenant_name}-vdc"
  group_ids = [opennebula_group.tenant.id]
  zones {
    id            = 0
    cluster_ids   = [0]
    host_ids      = [0]
    datastore_ids = [0, 1, 2]
    vnet_ids      = [0]
  }
}
resource "opennebula_virtual_machine" "vms" {
  count       = var.vm_count
  name        = "${var.tenant_name}-vm-${format("%02d", count.index + 1)}"
  template_id = var.template_id
  group       = opennebula_group.tenant.name
  depends_on  = [opennebula_virtual_data_center.vdc]
}
