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

module "k8s_master" {
  source      = "../../modules/vdc-vm"
  name        = "k8s-master"
  template_id = var.k8s_template_id
}

module "k8s_worker1" {
  source      = "../../modules/vdc-vm"
  name        = "k8s-worker-01"
  template_id = var.k8s_template_id
}
