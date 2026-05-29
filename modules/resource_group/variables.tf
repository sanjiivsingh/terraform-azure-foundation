variable "resource_groups" {

  description = "Map of Resource Group configurations"
  type = map(object({
    name     = string
    location = string

    tags = optional(map(string), {})
  }))
  validation {

    condition = alltrue([
      for rg in var.resource_groups :
      length(trim(rg.name)) > 0
    ])

    error_message = "Resource Group name cannot be empty."
  }
}