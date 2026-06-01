# Storage Account Module

## Purpose

Reusable Terraform module for deploying Azure Storage Accounts.

This module is being developed as part of the Terraform Azure Foundation project and demonstrates multiple Terraform dependency management patterns, progressing from standalone deployments to enterprise-style module integration.

---

## Current Status

✅ Implemented

Features:

* Multiple Storage Account deployment using for_each
* Input validation
* Tag support
* Module outputs
* Reusable module design

## Inputs

| Variable                 | Type        | Required | Description          |
| ------------------------ | ----------- | -------- | -------------------- |
| name                     | string      | Yes      | Storage Account name |
| resource_group_name      | string      | Yes      | Resource Group name  |
| location                 | string      | Yes      | Azure region         |
| account_tier             | string      | Yes      | Standard or Premium  |
| account_replication_type | string      | Yes      | LRS, GRS, ZRS, etc   |
| tags                     | map(string) | No       | Resource tags        |

## Validation Rules

* Storage Account names must be lowercase alphanumeric
* Storage Account names must be between 3 and 24 characters
* Resource Group name cannot be empty
* Location cannot be empty
* Account Tier must be Standard or Premium
* Replication Type must be a supported Azure value

## Outputs

storage_account_details

Returns:

* name
* id
* location
* primary_blob_endpoint

## Example Usage

```hcl
module "storage_account" {

  source = "../../modules/storage_account"

  storage_accounts = var.storage_accounts
}
```


---

## Planned Resources

This module will manage the following Azure resources:

```hcl
azurerm_storage_account
```

Future versions may include support for:

* Blob Containers
* File Shares
* Queues
* Tables
* Private Endpoints
* Diagnostic Settings

````

---

## Planned Input Structure

### Version 1 (Standalone Deployment)

```hcl
storage_accounts = {

  stdev001 = {

    name                     = "stdev001"
    resource_group_name      = "rg-dev-eastus"
    location                 = "eastus"

    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
      environment = "dev"
      managed_by  = "Terraform"
    }
  }
}
````

---

## Planned Input Notes

| Attribute                | Required | Description               |
| ------------------------ | -------- | ------------------------- |
| name                     | Yes      | Storage Account name      |
| resource_group_name      | Yes      | Target Resource Group     |
| location                 | Yes      | Azure region              |
| account_tier             | Yes      | Standard or Premium       |
| account_replication_type | Yes      | LRS, GRS, RAGRS, ZRS etc. |
| tags                     | No       | Resource tags             |

---

## Planned Output Structure

```hcl
storage_account_details = {

  stdev001 = {

    name             = "stdev001"
    id               = "/subscriptions/..."
    location         = "eastus"
    primary_endpoint = "https://..."
  }
}
```

---

## Design Evolution

This module will be implemented in three stages to demonstrate Terraform dependency management approaches.

### Version 1 – Standalone Deployment

Storage Account receives all required values directly from terraform.tfvars.

```text
terraform.tfvars
      │
      ▼
Storage Account Module
      │
      ▼
Storage Account
```

---

### Version 2 – Explicit Dependency

Storage Account module explicitly depends on the Resource Group module using:

```hcl
depends_on = [
  module.resource_group
]
```

---

### Version 3 – Implicit Dependency

Storage Account module consumes outputs from the Resource Group module.

Example:

```hcl
module.resource_group.resource_group_details
```

Terraform automatically builds the dependency graph.

No explicit dependency is required.

---

## Example Usage

Example usage will be added after implementation is completed.

---

## Related Documentation

Project Documentation:

```text
docs/architecture/
docs/diagrams/
```

Environment Integration:

```text
environments/dev/
```

---

## Module Roadmap

* [x] Contract Design
* [x] Documentation
* [x] Architecture Planning
* [ ] Standalone Deployment
* [ ] Explicit Dependency Model
* [ ] Implicit Dependency Model
* [ ] Deployment Validation
* [ ] Production Hardening
