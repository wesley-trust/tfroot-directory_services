# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "DirectoryServices"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Prod_BCDR = [
      "North Central US"
    ]

    Dev = [
      "UK South"
    ]

    Dev_BCDR = [
      "North Central US"
    ]

    default = [
      "UK South"
    ]

    default_BCDR = [
      "North Central US"
    ]
  }
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "service_recovery_services_location" {
  description = "The production resource locations to backup"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Prod_BCDR = [
      "North Central US"
    ]

    Dev = [
      "UK South"
    ]

    Dev_BCDR = [
      "North Central US"
    ]

    default = [
      "UK South"
    ]

    default_BCDR = [
      "North Central US"
    ]
  }
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "DirectoryServices" = "ACD"
  }
}

variable "resource_image" {
  description = "Desired image for the provisioned resources"
  type        = string
  default     = "windows_server_2022-domain_services"
}

variable "resource_image_group" {
  description = "Resource group name of image for the provisioned resources"
  type        = string
  default     = "ImageServices-domain_services-Prod-UKS-01-rg"
}

variable "operating_system_platform" {
  description = "Desired OS for the provisioned resources"
  type        = string
  default     = "Windows"
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(any)
  default = {
    Prod = {
      "DirectoryServices" = 2
    },

    Prod_BCDR = {
      "DirectoryServices" = 1
    }

    Dev = {
      "DirectoryServices" = 1
    },

    Dev_BCDR = {
      "DirectoryServices" = 1
    }

    default = {
      "DirectoryServices" = 2
    },

    default_BCDR = {
      "DirectoryServices" = 1
    },
  }
}

variable "resource_recovery_services_instance_count" {
  description = "Desired number of the provisioned resources to backup in each service environment"
  type        = map(any)
  default = {
    Prod = {
      "DirectoryServices" = 1
    },

    Prod_BCDR = {
      "DirectoryServices" = 0
    }

    Dev = {
      "DirectoryServices" = 1
    },

    Dev_BCDR = {
      "DirectoryServices" = 0
    }

    default = {
      "DirectoryServices" = 1
    },

    default_BCDR = {
      "DirectoryServices" = 0
    },
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    Prod = {
      "DirectoryServices" = "Standard_B1s"
    },

    Prod_BCDR = {
      "DirectoryServices" = "Standard_B1s"
    }

    Dev = {
      "DirectoryServices" = "Standard_B1s"
    },

    Dev_BCDR = {
      "DirectoryServices" = "Standard_B1s"
    }

    default = {
      "DirectoryServices" = "Standard_B1s"
    }

    default_BCDR = {
      "DirectoryServices" = "Standard_B1s"
    }
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.2.0/24"
    "North Europe"     = "10.2.2.0/24"
    "West Europe"      = "10.4.2.0/24"
    "North Central US" = "10.6.2.0/24"
  }
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = map(any)
  default = {
    "UK South" = [
      "10.0.2.4",
      "10.0.2.5"
    ]

    "North Europe" = [
      "10.2.2.4",
      "10.2.2.5"
    ]

    "West Europe" = [
      "10.4.2.4",
      "10.4.2.5"
    ]

    "North Central US" = [
      "10.6.2.4",
      "10.6.2.5"
    ]
  }
}

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
  default     = "spoke"
}

variable "resource_network_peer_role" {
  description = "The network type for peering"
  type        = string
  default     = "hub"
}

variable "resource_delete_protection_enabled" {
  description = "Whether 'soft delete' protection is enabled for backups"
  type        = bool
  default     = true
}

variable "resource_shutdown_enabled" {
  description = "Whether to shutdown the VMs at 11pm daily"
  type        = bool
  default     = true
}

variable "resource_automatic_backups_enabled" {
  description = "Whether to automatically backup specified instances"
  type        = bool
  default     = false
}

variable "resource_network_peer_deployment" {
  description = "Deployment identifier for the resource network to peer"
  type        = string
  default     = "01"
}
