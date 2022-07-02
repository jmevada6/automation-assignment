output "hostname_l" {
  value = azurerm_linux_virtual_machine.vm1[*].name
}
output "publicip_l" {
  value = azurerm_linux_virtual_machine.vm1[*].public_ip_address
}
output "privateip_l" {
  value = azurerm_linux_virtual_machine.vm1[*].private_ip_address
}
output "dns_l" {
  value = azurerm_public_ip.pip1[*].fqdn
}

output "vmlinuxids" {
  value = azurerm_linux_virtual_machine.vm1[*].id
}

output "vmlinuxnics" {
  value = azurerm_network_interface.nic1[*].id
}
