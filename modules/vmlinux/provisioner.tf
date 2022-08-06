resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.vm1]

  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
    connection {
      type        = "ssh"
      user        = var.adusername
      private_key = file("~/.ssh/id_rsa")
      host        = element(azurerm_public_ip.pip1[*].fqdn, count.index + 1)
    }
  }
}

