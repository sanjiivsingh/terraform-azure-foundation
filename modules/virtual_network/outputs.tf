output "virtual_networks" {
  description = "Outputs of created virtual networks"
  value       = azurerm_virtual_network.vnet
}

output "subnets" {
  description = "Outputs of created subnets"
  value       = azurerm_subnet.subnet
}
