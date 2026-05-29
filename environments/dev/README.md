# Development Environment

This folder represents the Development environment.

In Terraform terminology, this folder acts as the Root Module.

## Files

| File | Purpose |
|--------|----------|
| provider.tf | Azure provider configuration |
| versions.tf | Terraform and provider version constraints |
| main.tf | Calls child modules |
| variables.tf | Variable declarations |
| terraform.tfvars | Environment-specific values |

## Flow

Developer
    ↓
terraform apply
    ↓
Development Root Module
    ↓
Child Modules
    ↓
Azure Resources