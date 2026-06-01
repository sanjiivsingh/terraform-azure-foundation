# Storage Account Module

## Purpose

Reusable Terraform module for deploying Azure Storage Accounts.

This module is being developed as part of the Terraform Azure Foundation project and demonstrates multiple Terraform dependency management patterns, progressing from standalone deployments to enterprise-style module integration.

---

## Current Status

🚧 In Development

Current Phase:

* Module contract design
* Architecture design
* Documentation

Upcoming Phases:

* Standalone implementation
* Explicit dependency implementation
* Implicit dependency implementation
* Deployment verification

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
