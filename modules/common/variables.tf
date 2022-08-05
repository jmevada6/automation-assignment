variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "tags" {
  type = map(any)
}
# Log Analytic workspace variable
variable "log_workspace_name" {
  default = "acctest-01"
}
variable "log_workspace_sku" {
  default = "PerGB2018"
}
variable "log_workspace_retention" {
  default = 30
}
# vault variable
variable "rs_vault_name" {
  default = "rsvault1"
}
variable "rs_vault_sku" {
  default = "Standard"
}
# Storage Account variable
variable "ssaccount_name" {
  type = string
}
variable "ssaccount_tier" {
  default = "Standard"
}
variable "ssaccount_replication" {
  default = "LRS"
}
