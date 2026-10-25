locals {

  storage_accounts = {

    for key, value in var.storage_accounts :
    key => {
      name                     = value.name
      resource_group_name      = module.resource_group.resource_group_details[value.rgkey].name
      location                 = module.resource_group.resource_group_details[value.rgkey].location
      account_tier             = value.account_tier
      account_replication_type = value.account_replication_type

      tags = value.tags

    }
  }
}