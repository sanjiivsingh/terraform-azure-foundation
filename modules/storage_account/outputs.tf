output "storage_account_details" {

  description = "Storage Account details keyed by logical storage account key"

  value = {
    for key, value in azurerm_storage_account.this :

    key => {
      name             = value.name
      id               = value.id
      location         = value.location
      primary_endpoint = value.primary_blob_endpoint
    }
  }
}