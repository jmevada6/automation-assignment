resource "azurerm_virtual_network" "network-vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  address_space       = var.vnet_adspace
  tags                = var.tags
}
resource "azurerm_subnet" "ns1" {
  name                 = var.subnet1_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet1_adspace
  depends_on           = [azurerm_virtual_network.network-vnet]
}
