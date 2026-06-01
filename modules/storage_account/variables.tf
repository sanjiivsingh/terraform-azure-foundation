variable "storage_accounts" {

  description = "Map of Storage Account configurations"

  type = map(object({

    name                     = string
    resource_group_name      = string
    location                 = string
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

  # resource group name validation
  validation {

    condition = alltrue([
      for sa in var.storage_accounts :
      length(trimspace(sa.resource_group_name)) > 0
    ])

    error_message = "resource_group_name cannot be empty."
  }

  #location name empty : validation
  validation {

    condition = alltrue([
      for sa in var.storage_accounts :
      length(trimspace(sa.location)) > 0
    ])

    error_message = "location cannot be empty."
  }
}