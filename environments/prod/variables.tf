variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = {}
}

variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "subnets" {
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_key            = string
    address_prefixes    = list(string)
  }))
  default = {}
}

variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool, true)
    soft_delete_retention_days  = optional(number, 7)
    purge_protection_enabled    = optional(bool, true)
    sku_name                    = optional(string, "standard")
    network_acls_default_action = optional(string, "Deny")
    network_acls_ip_rules       = optional(list(string), [])
    tags                        = optional(map(string), {})
  }))
  default = {}
}
