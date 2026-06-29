# Development Environment

Development environment root module.

## Purpose

Deploys Azure infrastructure using reusable child modules.

Implemented Modules

- Resource Group

Modules Under Development

- Storage Account

---

## Architecture

terraform.tfvars
      |
      v
variables.tf
      |
      v
main.tf
      |
      v
module.resource_group
      |
      v
Azure Resource Groups

---

## Deployment

### Initialize

terraform init

### Validate

terraform validate

### Plan

terraform plan

### Apply

terraform apply

---

## Deployed Resources

### Resource Groups

| Name              |
| ----------------- |
| rg-dev-eastus     |
| rg-dev-southindia |

### Storage Accounts

| Name       | Resource Group | Location |
| ---------- | -------------- | -------- |
| stdevsa001 | rg-dev-eastus  | eastus   |

## Terraform Dependency Demonstrations

This repository demonstrates multiple Terraform dependency management patterns.

### Standalone Deployment

Resources are deployed independently without module dependencies.

### Explicit Dependency

Dependencies are enforced using:

```hcl
depends_on = [
  module.resource_group
]
```

### Implicit Dependency

This environment demonstrates Terraform's implicit dependency mechanism.

Storage Accounts reference a logical Resource Group key instead of directly specifying:

resource_group_name
location

Example:

storage_accounts = {
  stdev001 = {
    rgkey = "rg-dev-eastus"
  }
}

The local value transformation resolves the key:

rgkey
  ↓
resource group outputs
  ↓
storage account inputs

This automatically creates a dependency between the Resource Group module and Storage Account module.

No explicit depends_on statement is required.

### Validation

The development environment has been validated using:

* terraform fmt
* terraform validate
* terraform plan
* terraform apply

Deployment screenshots are available under:

docs/screenshots/


---

## Backend

Azure Storage Account Backend

State File:
gitazurefoundationrepo.tfstate
