output "hostname_w" {
  value = [azurerm_windows_virtual_machine.vm2.name]
}
output "publicip_w" {
  value = [azurerm_windows_virtual_machine.vm2.public_ip_address]
}
output "privateip_w" {
  value = [azurerm_windows_virtual_machine.vm2.private_ip_address]
}
output "dns_w" {
  value = [azurerm_public_ip.pip2.fqdn]
}


output "vmlinuxids" {
  value = azurerm_windows_virtual_machine.vm2.id
}
