# output from common 
output "common_log_workspace_name" { value = module.common.common_log_workspace_name }
output "common_vault_name" { value = module.common.common_vault_name }
output "common_storage_name" { value = module.common.common_storage_name }
output "storage_account_blob_endpoint" { value = module.common.storage_account_blob_endpoint }

output "dbname" { value = module.database.dbname }

output "lbname" { value = module.loadbalancer.lbname }

output "network_vnet_name" { value = module.network.network_vnet_name }
output "network_subnet_name" { value = module.network.network_subnet_name }
output "network_subnet_id" { value = module.network.network_subnet_id }

output "rg_name" { value = module.rgroup.rg_name }
output "rg_location" { value = module.rgroup.rg_location }

output "privateip_l" { value = module.vmlinux.privateip_l }
output "dns_l" { value = module.vmlinux.dns_l }
output "vmlinuxids" { value = module.vmlinux.vmlinuxids }
output "vmlinuxnics" { value = module.vmlinux.vmlinuxnics }

output "hostname_w" { value = module.vmwindows.hostname_w }
output "publicip_w" { value = module.vmwindows.publicip_w }
output "privateip_w" { value = module.vmwindows.privateip_w }
output "dns_w" { value = module.vmwindows.dns_w }
output "vmlinuxids_w" { value = module.vmwindows.vmlinuxids }
