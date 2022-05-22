# Calculate local variables
locals {
  # Resource
  resource_name = lookup(var.resource_name, var.service_name, null)

  # Env Specific
  resource_locations                        = lookup(var.service_location, "${terraform.workspace}", null)
  resource_instance_size                    = lookup(lookup(var.resource_instance_size, "${terraform.workspace}", null), var.service_name, null)
  resource_instance_count                   = lookup(lookup(var.resource_instance_count, "${terraform.workspace}", null), var.service_name, null)
  resource_recovery_services_locations      = lookup(var.service_recovery_services_location, "${terraform.workspace}", null)
  resource_recovery_services_instance_count = lookup(lookup(var.resource_recovery_services_instance_count, "${terraform.workspace}", null), var.service_name, null)

  # Env DR Specific
  resource_bcdr_locations                        = lookup(var.service_location, "${terraform.workspace}_BCDR", null)
  resource_bcdr_instance_size                    = lookup(lookup(var.resource_instance_size, "${terraform.workspace}_BCDR", null), var.service_name, null)
  resource_bcdr_instance_count                   = lookup(lookup(var.resource_instance_count, "${terraform.workspace}_BCDR", null), var.service_name, null)
  resource_bcdr_recovery_services_locations      = lookup(var.service_recovery_services_location, "${terraform.workspace}_BCDR", null)
  resource_bcdr_recovery_services_instance_count = lookup(lookup(var.resource_recovery_services_instance_count, "${terraform.workspace}_BCDR", null), var.service_name, null)
}
