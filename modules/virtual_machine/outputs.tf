output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "vm_admin_username" {
  value       = module.vm.admin_username
  description = "Admin username of the VM"
}

