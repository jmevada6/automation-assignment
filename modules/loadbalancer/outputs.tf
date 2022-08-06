output "lbname" {
  value = azurerm_lb.frontlb.name
}
output "lb_fqdn" {
  value = azurerm_public_ip.pip3.fqdn
}
