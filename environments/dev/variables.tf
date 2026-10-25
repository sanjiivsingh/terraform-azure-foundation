variable "resource_groups" {

  description = "Map of Resource Group Configurations in Root Module"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  validation {

    condition = alltrue([
      for rg in var.resource_groups :
      length(trimspace(rg.name)) > 0
    ])
    error_message = "Resource Group name can not be empty"
  }
}

variable "storage_accounts" {

  description = "Map of Storage Account configurations"

  type = map(object({

    name                     = string
    rgkey                    = string
    account_tier             = string
    account_replication_type = string

    tags = optional(map(string), {})
  }))

  # storage account name validation
  validation {

    condition = alltrue([
      for sa in var.storage_accounts :
      can(regex("^[a-z0-9]{3,24}$", sa.name))
    ])

    error_message = "Storage Account name must contain only lowercase letters and numbers and be between 3 and 24 characters."
  }

  # account_tier validation
  validation {

    condition = alltrue([
      for sa in var.storage_accounts :
      contains(
        ["STANDARD", "PREMIUM"],
        upper(sa.account_tier)
      )
    ])

    error_message = "account_tier must be either Standard or Premium."
  }

  # account replication type validation
  validation {

    condition = alltrue([
      for sa in var.storage_accounts :
      contains(
        ["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"],
        upper(sa.account_replication_type)
      )
    ])

    error_message = "Invalid replication type. Allowed values: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }

  # resource group key name validation
  validation {

    condition = alltrue([
      for sa in var.storage_accounts :
      contains(keys(var.resource_groups), sa.rgkey)
    ])

    error_message = "Storage account rgkey must exist in resource_groups."
  }
}