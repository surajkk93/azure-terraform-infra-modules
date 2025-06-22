output "vm_public_ip" {
  value = module.virtual_machine.public_ip
}

output "vm_admin_username" {
  value       = module.vm.admin_username
  description = "Admin username of the VM"
}
