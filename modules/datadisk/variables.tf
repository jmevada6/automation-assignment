variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "tags" {
  type = map(any)
}

variable "nb_count" {
  default = 2
}
variable "dd_name_l" {
  default = "mylinuxdd"
}
variable "dd_name_w" {
  default = "mywinsdd"
}

variable "vmlinuxids" {
  type = list(string)
}
variable "vmwindowsids" {
  type = string
}

variable "lun" {
  default = 0
}
variable "data_disk_caching" {
  default = "ReadWrite"
}
