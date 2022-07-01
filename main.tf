variable "common_tags" {
  default = {
    Project : "Automation Project - Assignment 1"
    Name : "Jay.Mevada"
    ExpirationDate : "2022-06-30"
    Environment : "Lab"
  }
}
module "rgroup" {
  source      = "./modules/rgroup"
  rg_name     = "2383-assignment1-RG"
  rg_location = "Australia East"
  tags        = var.common_tags
}
module "network" {
  source      = "./modules/network"
  rg_name     = module.rgroup.rg_name
  rg_location = module.rgroup.rg_location
  tags        = var.common_tags
}
module "common" {
  source         = "./modules/common"
  rg_name        = module.rgroup.rg_name
  rg_location    = module.rgroup.rg_location
  tags           = var.common_tags
  ssaccount_name = "n01522383ssname1"
}
