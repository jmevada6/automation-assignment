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
# for avaibility set
variable "update_domain" { default = 10 }
variable "fault_domain" { default = 2 }
variable "avset1_name" { default = "AvsetforLinux" }
# for network
variable "subnet1_id" {
  type = string
}
# For linux vm
variable "vmname_l" {
  default = "mylinux"
}
variable "size" {
  type = string
}
variable "adusername" {
  type = string
}
variable "adpassword" {
  type = string
}

variable "storage_account_blob_endpoint" {
  type = string
}

variable "os_disk" {
  default = {
    storage_account_type = "Premium_LRS"
    disk_size            = 32
    caching              = "ReadWrite"
  }
}
variable "os_image" {
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}

variable "vmextension" {
  default = {
    publisher            = "Microsoft.Azure.NetworkWatcher"
    type                 = "NetworkWatcherAgentLinux"
    type_handler_version = "1.4"
  }
}
