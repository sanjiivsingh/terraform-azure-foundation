variable "virtual_networks" {
  description = "Map of virtual networks to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "subnets" {
  description = "Map of subnets to create within virtual networks"
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_key            = string
    address_prefixes    = list(string)
  }))
  default = {}
}
