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
      V
variables.tf
      |
      V
main.tf
      |
      V
module.resource_group
      |
      V
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

Dependencies are automatically inferred when module outputs are referenced by other modules.

This is the preferred Terraform design pattern and is recommended whenever Terraform can determine the dependency relationship automatically.


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
