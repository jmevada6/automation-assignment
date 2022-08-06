variable "common_tags" {
  default = {
    Project : "Automation Project - Assignment 2"
    Name : "Jay and Amarinder"
    ExpirationDate : "2022-08-12"
    Environment : "Lab"
  }
}
module "rgroup" {
  source      = "./modules/rgroup"
  rg_name     = "2383-assignment02-RG"
  rg_location = "Australia East"
  tags        = var.common_tags
}
module "network" {
  source      = "./modules/network"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags

  depends_on = [module.rgroup]
}
module "common" {
  source         = "./modules/common"
  rg_name        = module.rgroup.rg_name
  rg_location    = module.rgroup.rg_location
  tags           = var.common_tags
  ssaccount_name = "n01522383ssa"

  depends_on = [module.rgroup]
}
module "vmlinux" {
  source      = "./modules/vmlinux"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags
  subnet1_id  = module.network.network_subnet_id

  size       = "Standard_B1s"
  adusername = "N01522383"
  adpassword = "<P@$$w0rd>"

  storage_account_blob_endpoint = module.common.storage_account_blob_endpoint

  depends_on = [module.network, module.common]
}
module "vmwindows" {
  source      = "./modules/vmwindows"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags
  subnet1_id  = module.network.network_subnet_id

  size       = "Standard_B1s"
  adusername = "N01522383"
  adpassword = "<P@$$w0rd>"

  storage_account_blob_endpoint = module.common.storage_account_blob_endpoint
  depends_on                    = [module.network, module.common]
}

module "datadisk" {
  source      = "./modules/datadisk"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags

  vmlinuxids   = module.vmlinux.vmlinuxids
  vmwindowsids = module.vmwindows.vmlinuxids

  # depends_on = [module.vmlinux]
  depends_on = [module.vmlinux, module.vmwindows]
}

module "loadbalancer" {
  source      = "./modules/loadbalancer"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags
  vmlinuxnics = module.vmlinux.vmlinuxnics
  depends_on  = [module.vmlinux]
}

module "database" {
  source      = "./modules/database"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags
  server_name = "n01522383-dbserver"
  adusername  = "psqladmin"
  adpassword  = "H@Sh1CoR3!"
  depends_on  = [module.rgroup]
}

module "provisionerforansible" {
  source     = "./modules/provisioner"
  depends_on = [module.datadisk]
}
