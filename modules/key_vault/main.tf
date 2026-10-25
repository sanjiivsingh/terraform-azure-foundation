data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each                    = var.key_vaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = try(each.value.enabled_for_disk_encryption, true)
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = try(each.value.soft_delete_retention_days, 7)
  purge_protection_enabled    = try(each.value.purge_protection_enabled, true)
  sku_name                    = try(each.value.sku_name, "standard")
  rbac_authorization_enabled  = try(each.value.rbac_authorization_enabled, true)

  network_acls {
    bypass         = "AzureServices"
    default_action = try(each.value.network_acls_default_action, "Deny")
    ip_rules       = try(each.value.network_acls_ip_rules, [])
  }

  tags = try(each.value.tags, {})
}
