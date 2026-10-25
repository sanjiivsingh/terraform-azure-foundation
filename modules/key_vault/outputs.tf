output "key_vaults" {
  description = "Outputs of provisioned Key Vault instances"
  value       = azurerm_key_vault.kv
  sensitive   = true
}
