resource_groups = {
  rg_prod = {
    name     = "rg-prod-core-001"
    location = "centralindia"
    tags = {
      Environment = "Production"
      ManagedBy   = "Terraform"
      Compliance  = "CIS-Azure"
    }
  }
}

virtual_networks = {
  vnet_prod = {
    name                = "vnet-prod-core-001"
    location            = "centralindia"
    resource_group_name = "rg-prod-core-001"
    address_space       = ["10.100.0.0/16"]
    tags = {
      Environment = "Production"
    }
  }
}

subnets = {
  snet_app = {
    name                = "snet-prod-app-001"
    resource_group_name = "rg-prod-core-001"
    vnet_key            = "vnet_prod"
    address_prefixes    = ["10.100.1.0/24"]
  }
  snet_db = {
    name                = "snet-prod-db-001"
    resource_group_name = "rg-prod-core-001"
    vnet_key            = "vnet_prod"
    address_prefixes    = ["10.100.2.0/24"]
  }
}

key_vaults = {
  kv_prod = {
    name                        = "kv-prod-core-001"
    location                    = "centralindia"
    resource_group_name         = "rg-prod-core-001"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 90
    purge_protection_enabled    = true
    sku_name                    = "standard"
    network_acls_default_action = "Deny"
    tags = {
      Environment = "Production"
      Security    = "ZeroTrust"
    }
  }
}
