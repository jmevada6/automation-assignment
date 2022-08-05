resource "azurerm_public_ip" "pip3" {
  name                = "PublicIPForLB"
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "frontlb" {
  name                = "frontlb"
  location            = var.rg_location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.pip3.id
  }
}


resource "azurerm_lb_backend_address_pool" "lb_backendpool" {
  loadbalancer_id = azurerm_lb.frontlb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_vm_association" {
  count                   = var.nb_count
  network_interface_id    = var.vmlinuxnics[count.index]
  ip_configuration_name   = "${var.vmname_l}-ipconfig-${format("%1d", count.index + 1)}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backendpool.id
}
