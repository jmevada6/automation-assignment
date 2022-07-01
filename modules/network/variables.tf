variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "tags" {
  type = map(any)
}

variable "vnet_name" {
  default = "network-vnet"
}
variable "vnet_adspace" {
  default = ["10.0.0.0/16"]
}
variable "subnet1_name" {
  default = "network-subnet1"
}
variable "subnet1_adspace" {
  default = ["10.0.1.0/24"]
}
