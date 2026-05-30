resource_groups = {
  rg-dev-eu = {
    name     = "rg-dev-eastus-1"
    location = "eastus"
    tags = {
      managed_by  = "Terraform"
      environment = "dev"
      project     = "terraform azure foundation"
    }
  }
  rg-dev-si = {
    name     = "rg2-dev-southindia-1"
    location = "southindia"
    tags = {
      managed_by  = "Terraform"
      environment = "dev"
      project     = "terraform azure foundation"
    }
  }
}