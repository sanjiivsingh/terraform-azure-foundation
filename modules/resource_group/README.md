# Resource Group Module

Reusable Terraform module for creating Azure Resource Groups.

## Purpose

This module is responsible for creating one or more Azure Resource Groups.

## Resources

Planned Resources:

- azurerm_resource_group

## Input Structure

```hcl
resource_groups = {

  rg1 = {

    name     = "rg-dev-eastus"
    location = "East US"

    tags = {
      environment = "dev"
    }
  }
}
```
### Input Notes

| Attribute | Required | Description |
|------------|----------|-------------|
| name | Yes | Azure Resource Group name |
| location | Yes | Azure region |
| tags | No | Optional tags |

Tags are optional and can be omitted when not required.

## Output Structure

```hcl
resource_group_details = {

  rg1 = {

    name     = "rg-dev-eastus"
    id       = "/subscriptions/..."
    location = "East US"
  }
}
```

## Example Usage

```hcl
module "resource_group" {

  source = "../../modules/resource_group"

  resource_groups = var.resource_groups
}
```
## Relationship Design

Future modules will reference Resource Groups using logical keys.

Example:

```hcl
storage_accounts = {

  stg1 = {

    name   = "stgdev001"

    rg_key = "rg1"
  }
}
```

This allows future modules to consume Resource Group outputs without hardcoding Resource Group names.

## Notes
This module is designed to support multiple Resource Groups through a map-based input structure.

This module is designed to be:

- Reusable
- Generic
- Scalable
- Environment agnostic
- Dependency driven
- Compatible with future Azure modules

## Design Standards

- Use generic attribute names such as `name`.
- Support multiple Resource Groups through map-based inputs.
- Return outputs as maps.
- Keep tags optional.
- Support future module dependencies through logical keys.