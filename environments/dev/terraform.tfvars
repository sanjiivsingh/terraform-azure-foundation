# resource group details
resource_groups = {
  rg-dev-eastus = {
    name     = "rg-dev-eastus"
    location = "eastus"
    tags = {
      managed_by  = "Terraform"
      environment = "dev"
      project     = "terraform azure foundation"
    }
  }
  rg-dev-southindia = {
    name     = "rg-dev-southindia"
    location = "southindia"
    tags = {
      managed_by  = "Terraform"
      environment = "dev"
      project     = "terraform azure foundation"
    }
  }
}

# storage account details
storage_accounts = {

  stdev001 = {
    name                     = "stdevsa001"
    rgkey                    = "rg-dev-eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
      managed_by  = "Terraform"
      environment = "dev"
      project     = "terraform azure foundation"
    }
  }
}