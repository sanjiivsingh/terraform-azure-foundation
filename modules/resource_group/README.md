# Resource Group Module

Reusable Terraform module for creating Azure Resource Groups.

## Purpose

This module is responsible for creating one or more Azure Resource Groups.

## Resources

Planned Resources:

- azurerm_resource_group

## Inputs

To be documented.

## Outputs

To be documented.

## Example Usage

```hcl
module "resource_group" {

  source = "../../modules/resource_group"

}
```

## Notes

This module is designed to be:

- Reusable
- Generic
- Environment agnostic
- Compatible with future Azure modules
```