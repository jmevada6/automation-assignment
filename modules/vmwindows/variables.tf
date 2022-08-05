variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "tags" {
  type = map(any)
}
variable "subnet1_id" {
  type = string
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

# for avaibility set
variable "update_domain" { default = 10 }
variable "fault_domain" { default = 2 }
variable "avset2_name" { default = "AvsetforWindows" }

variable "vmname_w" {
  default = "mywins"
}
variable "os_disk" {
  default = {
    create_option        = "Attach"
    storage_account_type = "StandardSSD_LRS"
    disk_size            = 128
    caching              = "ReadWrite"
  }
}
variable "os_image" {
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
variable "vmextension" {
  default = {
    publisher            = "Microsoft.Azure.Security.AntimalwareSignature"
    type                 = "AntimalwareConfiguration"
    type_handler_version = "2.58"
  }
}
