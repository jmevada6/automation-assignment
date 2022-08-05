resource "azurerm_availability_set" "avset2" {
  name                         = var.avset2_name
  location                     = var.rg_location
  resource_group_name          = var.rg_name
  platform_update_domain_count = var.update_domain
  platform_fault_domain_count  = var.fault_domain
}

resource "azurerm_public_ip" "pip2" {
  name                = "${var.vmname_w}-pip"
  resource_group_name = var.rg_name
  location            = var.rg_location
  domain_name_label   = "${var.vmname_w}-dns"
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.vmname_w}-nic"
  location            = var.rg_location
  resource_group_name = var.rg_name
  tags                = var.tags

  ip_configuration {
    name                          = "${var.vmname_w}-ipconfig"
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip2.id
  }
}


resource "azurerm_windows_virtual_machine" "vm2" {
  name                = "${var.vmname_w}-vm"
  resource_group_name = var.rg_name
  location            = var.rg_location

  size           = var.size
  admin_username = var.adusername
  admin_password = var.adpassword
  computer_name  = var.vmname_w

  availability_set_id = azurerm_availability_set.avset2.id

  tags = var.tags

  network_interface_ids = [
    azurerm_network_interface.nic2.id
  ]


  os_disk {
    name                 = "${var.vmname_w}-os-disk"
    caching              = var.os_disk["caching"]
    storage_account_type = var.os_disk["storage_account_type"]
    disk_size_gb         = var.os_disk["disk_size"]
  }

  source_image_reference {
    publisher = var.os_image["publisher"]
    offer     = var.os_image["offer"]
    sku       = var.os_image["sku"]
    version   = var.os_image["version"]
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_blob_endpoint
  }

  depends_on = [azurerm_availability_set.avset2]

}


# resource "azurerm_virtual_machine_extension" "vmx" {
#   name                 = "${var.vmname_w}-vmexe"
#   virtual_machine_id   = azurerm_windows_virtual_machine.vm2.id
#   publisher            = var.vmextension["publisher"]
#   type                 = var.vmextension["type"]
#   type_handler_version = var.vmextension["type_handler_version"]
#   tags                 = var.tags
# }
