output "resource_group_details" {

  description = "Resource Group details keyed by logical resource group key"

  value = {
    for key, value in azurerm_resource_group.this :

    key => {
      name     = value.name
      id       = value.id
      location = value.location
      tags     = value.tags
    }
  }

}