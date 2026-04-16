# Module VDC Tenant - Onboarding automatisé d'un tenant
# Ce module crée l'ensemble des ressources nécessaires pour un nouveau tenant :
# groupe, utilisateur admin, VDC avec quotas, et optionnellement des VMs

terraform {
  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
    }
  }
}

# Groupe utilisateur du tenant avec quotas de ressources
resource "opennebula_group" "tenant" {
  name = var.tenant_name

  quotas {
    vm_quotas {
      cpu            = var.cpu_quota       # Nombre max de vCPU
      memory         = var.ram_quota       # RAM max en Mo
      running_cpu    = var.cpu_quota
      running_memory = var.ram_quota
      running_vms    = var.vm_quota        # Nombre max de VMs actives
      vms            = var.vm_quota
    }
  }
}

# Utilisateur administrateur du tenant
resource "opennebula_user" "admin" {
  name          = "${var.tenant_name}-admin"
  password      = var.admin_password
  auth_driver   = "core"
  primary_group = opennebula_group.tenant.id  # Rattaché au groupe tenant
}

# Virtual Data Center - environnement isolé du tenant
# Mapping vers les ressources physiques (clusters, hosts, datastores, réseaux)
resource "opennebula_virtual_data_center" "vdc" {
  name      = "${var.tenant_name}-vdc"
  group_ids = [opennebula_group.tenant.id]

  zones {
    id            = 0          # Zone par défaut
    cluster_ids   = [0]        # Cluster principal
    host_ids      = [0]        # Host KVM
    datastore_ids = [0, 1, 2]  # system, default, files
    vnet_ids      = [0]        # Réseau virtuel vnet
  }
}

# VMs optionnelles pré-provisionnées pour le tenant
resource "opennebula_virtual_machine" "vms" {
  count       = var.vm_count
  name        = "${var.tenant_name}-vm-${format("%02d", count.index + 1)}"
  template_id = var.template_id
  group       = opennebula_group.tenant.name
  depends_on  = [opennebula_virtual_data_center.vdc]
}
