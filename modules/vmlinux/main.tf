resource "azurerm_availability_set" "avset1" {
  name                         = var.avset1_name
  location                     = var.rg_location
  resource_group_name          = var.rg_name
  platform_update_domain_count = var.update_domain
  platform_fault_domain_count  = var.fault_domain
  tags                         = var.tags
}

resource "azurerm_public_ip" "pip1" {
  count               = var.nb_count
  name                = "${var.vmname_l}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  domain_name_label   = "${var.vmname_l}-dns-${format("%1d", count.index + 1)}"
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic1" {
  count               = var.nb_count
  name                = "${var.vmname_l}-nic-${format("%1d", count.index + 1)}"
  location            = var.rg_location
  resource_group_name = var.rg_name
  tags                = var.tags
  ip_configuration {
    name                          = "${var.vmname_l}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip1[*].id, count.index + 1)
  }
}



resource "azurerm_linux_virtual_machine" "vm1" {
  count               = var.nb_count
  name                = "${var.vmname_l}-vm-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg_name
  location            = var.rg_location

  computer_name                   = "${var.vmname_l}-cn-${format("%1d", count.index + 1)}"
  size                            = var.size
  admin_username                  = var.adusername
  disable_password_authentication = false
  admin_password                  = var.adpassword

  tags = var.tags

  availability_set_id = azurerm_availability_set.avset1.id
  network_interface_ids = [
    element(azurerm_network_interface.nic1[*].id, count.index + 1)
  ]

  os_disk {
    name                 = "${var.vmname_l}-os-disk-${format("%1d", count.index + 1)}"
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

  depends_on = [azurerm_availability_set.avset1]
}


resource "azurerm_virtual_machine_extension" "vmextension1" {
  count                = var.nb_count
  name                 = "${var.vmname_l}-vmx-${format("%1d", count.index + 1)}"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm1[count.index].id
  publisher            = var.vmextension["publisher"]
  type                 = var.vmextension["type"]
  type_handler_version = var.vmextension["type_handler_version"]
  tags                 = var.tags
}
