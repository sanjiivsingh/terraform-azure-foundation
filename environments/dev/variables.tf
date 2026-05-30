variable "resource_groups" {

  description = "Map of Resource Group Configurations in Root Module"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  validation {

    condition = alltrue([
      for rg in var.resource_groups :
      length(trimspace(rg.name)) > 0
    ])
    error_message = "Resource Group name can not be empty"
  }
}