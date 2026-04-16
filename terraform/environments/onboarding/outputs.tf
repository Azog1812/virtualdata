output "tenant_a" {
  value = {
    vdc_id   = module.tenant_a.vdc_id
    group_id = module.tenant_a.group_id
    admin_id = module.tenant_a.admin_user_id
    vm_ids   = module.tenant_a.vm_ids
    vm_names = module.tenant_a.vm_names
  }
}
output "tenant_b" {
  value = {
    vdc_id   = module.tenant_b.vdc_id
    group_id = module.tenant_b.group_id
    admin_id = module.tenant_b.admin_user_id
    vm_ids   = module.tenant_b.vm_ids
    vm_names = module.tenant_b.vm_names
  }
}
