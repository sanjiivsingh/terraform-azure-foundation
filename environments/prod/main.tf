module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  source           = "../../modules/virtual_network"
  virtual_networks = var.virtual_networks
  subnets          = var.subnets
  depends_on       = [module.resource_group]
}

module "key_vault" {
  source     = "../../modules/key_vault"
  key_vaults = var.key_vaults
  depends_on = [module.resource_group]
}
