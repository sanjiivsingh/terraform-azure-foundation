# Resource Group Module

Reusable Azure Resource Group module.

## Features

- Multiple Resource Group deployment
- Map-based configuration
- Optional tags
- Input validation
- Standardized outputs

---

## Input Structure

resource_groups = {
  rg-dev-eastus = {
    name     = "rg-dev-eastus"
    location = "eastus"

    tags = {
      environment = "dev"
      managed_by  = "Terraform"
    }
  }
}

---

## Inputs

| Name | Type | Required |
|--------|--------|--------|
| name | string | Yes |
| location | string | Yes |
| tags | map(string) | No |

---

## Outputs

resource_group_details = {
  rg-dev-eastus = {
    name     = "rg-dev-eastus"
    id       = "/subscriptions/..."
    location = "eastus"
    tags     = {...}
  }
}

---

## Example Usage

module "resource_group" {

  source = "../../modules/resource_group"

  resource_groups = var.resource_groups

}

---

## Design Principles

- Reusable
- Generic
- Environment Agnostic
- Map Based
- Logical Key Driven
