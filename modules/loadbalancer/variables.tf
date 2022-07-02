variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "tags" {
  type = map(any)
}
variable "vmlinuxnics" {
  type = list(any)
}
variable "nb_count" {
  default = 2
}
variable "vmname_l" {
  default = "mylinux"
}
