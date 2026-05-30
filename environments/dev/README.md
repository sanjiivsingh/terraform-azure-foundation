# Development Environment

Development environment root module.

## Purpose

Deploys Azure infrastructure using reusable child modules.

Currently deployed:

- Resource Groups

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

## Current Deployment

| Resource | Status |
|-----------|----------|
| Resource Group Module | Completed |

---

## Resource Groups

rg-dev-eastus
rg-dev-southindia

---

## Backend

Azure Storage Account Backend

State File:
gitazurefoundationrepo.tfstate
