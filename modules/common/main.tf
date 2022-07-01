resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.log_workspace_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku                 = var.log_workspace_sku
  retention_in_days   = var.log_workspace_retention
  tags                = var.tags
}

resource "azurerm_recovery_services_vault" "rs_vault" {
  name                = var.rs_vault_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku                 = var.rs_vault_sku
  soft_delete_enabled = true
  tags                = var.tags
}

resource "azurerm_storage_account" "ssaccount" {
  name                     = var.ssaccount_name
  location                 = var.rg_location
  resource_group_name      = var.rg_name
  account_tier             = var.ssaccount_tier
  account_replication_type = var.ssaccount_replication
  tags                     = var.tags
}
