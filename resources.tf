module "directory_services" {
  for_each                  = toset(local.resource_locations)
  source                    = "github.com/wesley-trust/tfmodule-compute?ref=v1.2-compute"
  service_environment       = terraform.workspace
  service_deployment        = var.service_deployment
  service_name              = var.service_name
  service_location          = each.value
  resource_name             = local.resource_name
  resource_instance_count   = local.resource_instance_count
  resource_instance_size    = local.resource_instance_size
  resource_address_space    = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers      = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role     = var.resource_network_role
  resource_shutdown_enabled = var.resource_shutdown_enabled
  operating_system_platform = var.operating_system_platform
}

module "directory_services_network_peering" {
  for_each                         = toset(local.resource_locations)
  source                           = "github.com/wesley-trust/tfmodule-network_peering?ref=v1.1-network_peering"
  service_environment              = terraform.workspace
  resource_network_peer            = module.directory_services[each.value].network_name
  resource_group_peer              = module.directory_services[each.value].resource_group_name
  resource_network_peer_deployment = var.resource_network_peer_deployment
  resource_network_peer_role       = var.resource_network_peer_role
}

module "directory_services_recovery_services" {
  depends_on                                  = [module.directory_services]
  for_each                                    = toset(local.resource_recovery_services_locations)
  source                                      = "github.com/wesley-trust/tfmodule-recovery_services?ref=v0.11-beta-recovery_services"
  service_environment                         = terraform.workspace
  service_deployment                          = var.service_deployment
  service_name                                = "${var.service_name}-RSV"
  service_location                            = each.value
  resource_name                               = local.resource_name
  resource_recovery_services_instance_count   = local.resource_recovery_services_instance_count
  resource_recovery_services_virtual_machines = module.directory_services[each.value]
  resource_automatic_backups_enabled          = var.resource_automatic_backups_enabled
  resource_delete_protection_enabled          = var.resource_delete_protection_enabled
}

module "directory_services_bcdr" {
  for_each                  = toset(local.resource_bcdr_locations)
  source                    = "github.com/wesley-trust/tfmodule-compute?ref=v1.2-compute"
  service_environment       = terraform.workspace
  service_deployment        = var.service_deployment
  service_name              = var.service_name
  service_location          = each.value
  resource_name             = local.resource_name
  resource_instance_count   = local.resource_bcdr_instance_count
  resource_instance_size    = local.resource_bcdr_instance_size
  resource_address_space    = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers      = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role     = var.resource_network_role
  resource_shutdown_enabled = var.resource_shutdown_enabled
  operating_system_platform = var.operating_system_platform
}

module "directory_services_network_peering_bcdr" {
  for_each                         = toset(local.resource_bcdr_locations)
  source                           = "github.com/wesley-trust/tfmodule-network_peering?ref=v1.1-network_peering"
  service_environment              = terraform.workspace
  resource_network_peer            = module.directory_services_bcdr[each.value].network_name
  resource_group_peer              = module.directory_services_bcdr[each.value].resource_group_name
  resource_network_peer_deployment = var.resource_network_peer_deployment
  resource_network_peer_role       = var.resource_network_peer_role
}
