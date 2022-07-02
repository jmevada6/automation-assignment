resource "azurerm_managed_disk" "datadisk1_l" {
  count                = var.nb_count
  name                 = "${var.dd_name_l}-dd-${format("%1d", count.index + 1)}"
  location             = var.rg_location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux_data_disk_attach" {
  count              = var.nb_count
  managed_disk_id    = element(azurerm_managed_disk.datadisk1_l[*].id, count.index + 1)
  virtual_machine_id = var.vmlinuxids[count.index]
  lun                = var.lun
  caching            = var.data_disk_caching
  depends_on         = [azurerm_managed_disk.datadisk1_l]
}

resource "azurerm_managed_disk" "datadisk1_w" {
  name                 = "${var.dd_name_l}-dd-windows"
  location             = var.rg_location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_data_disk_attach" {
  managed_disk_id    = azurerm_managed_disk.datadisk1_w.id
  virtual_machine_id = var.vmwindowsids
  lun                = var.lun
  caching            = var.data_disk_caching
  depends_on         = [azurerm_managed_disk.datadisk1_w]
}

