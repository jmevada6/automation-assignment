output "common_log_workspace_name" {
  value = azurerm_log_analytics_workspace.log_workspace.name
}
output "common_vault_name" {
  value = azurerm_recovery_services_vault.rs_vault.name
}
output "common_storage_name" {
  value = azurerm_storage_account.ssaccount.name
}


output "storage_account_blob_endpoint" {
  value = azurerm_storage_account.ssaccount.primary_blob_endpoint
}
