output "network_vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}
output "network_subnet_name" {
  value = azurerm_subnet.ns1.name
}
output "network_subnet_id" {
  value = azurerm_subnet.ns1.id
}

