output "vdc_id" {
  value = opennebula_virtual_data_center.vdc.id
}
output "group_id" {
  value = opennebula_group.tenant.id
}
output "admin_user_id" {
  value = opennebula_user.admin.id
}
output "vm_ids" {
  value = opennebula_virtual_machine.vms[*].id
}
output "vm_names" {
  value = opennebula_virtual_machine.vms[*].name
}
