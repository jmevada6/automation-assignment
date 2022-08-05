terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate01522383RG"
    storage_account_name = "tfstate01522383sa"
    container_name       = "tfstatefiles"
    key                  = "tfstatekey"
  }
}
