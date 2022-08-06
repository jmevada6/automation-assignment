
resource "null_resource" "ansible-deploy" {
  #   depends_on = [azurerm_linux_virtual_machine.vm1]
  provisioner "local-exec" {
    command = "ansible-playbook --private-key ~/.ssh/id_rsa -i ansible/hosts ansible/playbook.yml"
  }
}
