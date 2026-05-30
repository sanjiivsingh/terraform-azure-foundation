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