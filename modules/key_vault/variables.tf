variable "key_vaults" {
  description = "Map of Key Vault instances to deploy"
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
