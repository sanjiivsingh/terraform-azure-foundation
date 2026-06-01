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

## Dependency Demonstrations

### Explicit Dependency

The storage account module explicitly depends on the resource group module.

Example:

depends_on = [
  module.resource_group
]

This pattern is demonstrated for educational purposes.

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
