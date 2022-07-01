resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.vm1]

  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
    connection {
      type     = "ssh"
      user     = var.adusername
      password = var.adpassword
      host     = element(azurerm_public_ip.pip1[*].fqdn, count.index + 1)
    }
  }
}
