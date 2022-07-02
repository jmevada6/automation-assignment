terraform {
  backend "azurerm" {
    resource_group_name  = "2383-assignment1-RG"
    storage_account_name = "n01522383ssname1"
    container_name       = "tfstatefiles"
    key                  = "tfstatekey"
  }
}
