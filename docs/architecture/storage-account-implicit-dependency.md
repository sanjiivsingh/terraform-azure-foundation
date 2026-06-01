# Storage Account Implicit Dependency Architecture

## Overview

This document describes the implicit dependency implementation between the Resource Group module and Storage Account module within the Terraform Azure Foundation project.

Unlike explicit dependencies that use `depends_on`, this implementation relies on Terraform's dependency graph generation through output consumption.

---

## Objective

Demonstrate how Terraform automatically determines deployment order when one module consumes outputs from another module.

The goal is to eliminate manual dependency management while maintaining correct resource deployment sequencing.

---

## Architecture Flow

Resource Group Configuration
→ Resource Group Module
→ Resource Group Outputs
→ Local Value Transformation
→ Storage Account Module
→ Storage Account Deployment

---

## Input Configuration

Storage Accounts do not directly receive:

* resource_group_name
* location

Instead they receive a logical key:

```hcl
storage_accounts = {
  stdev001 = {
    name  = "stdevsa001"
    rgkey = "rg-dev-eastus"

    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
```

---

## Local Value Resolution

The local block resolves the logical key into actual Resource Group values.

```hcl
locals {

  storage_accounts = {

    for key, value in var.storage_accounts :

    key => {

      name = value.name

      resource_group_name =
      module.resource_group.resource_group_details[value.rgkey].name

      location =
      module.resource_group.resource_group_details[value.rgkey].location

      account_tier             = value.account_tier
      account_replication_type = value.account_replication_type

      tags = value.tags
    }
  }
}
```

---

## Dependency Chain

terraform.tfvars

↓

var.storage_accounts

↓

locals.storage_accounts

↓

module.resource_group.outputs

↓

module.storage_account

Terraform automatically creates the dependency graph because Storage Account values depend on Resource Group outputs.

---

## Why This Is An Implicit Dependency

No explicit dependency is defined.

```hcl
depends_on = [module.resource_group]
```

is NOT used.

Terraform detects the relationship through output references.

---

## Benefits

### Terraform Native

Uses Terraform's built-in dependency graph.

### Better Scalability

Additional modules can consume Resource Group outputs without manual dependencies.

### Cleaner Code

No dependency declarations are required.

### Easier Maintenance

Changes in module outputs automatically propagate through the dependency graph.

---

## Comparison

### Explicit Dependency

```hcl
depends_on = [module.resource_group]
```

Terraform is instructed to wait.

### Implicit Dependency

```hcl
module.resource_group.resource_group_details[value.rgkey]
```

Terraform discovers the dependency automatically.

---

## Conclusion

Implicit dependencies are the preferred Terraform approach whenever a dependency can be expressed through data flow between resources or modules.
