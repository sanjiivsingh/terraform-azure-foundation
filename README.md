# Terraform Azure Foundation

Reusable and modular Azure infrastructure deployment using Terraform.

This repository is a hands-on Azure Infrastructure-as-Code project focused on building reusable Terraform modules, implementing dependency management patterns, and following enterprise-grade Git workflows.

The goal is to create a scalable Azure foundation that can be extended into a complete landing zone architecture.

---

# Project Objectives

* Build reusable Terraform modules for Azure resources.
* Follow a modular and scalable architecture.
* Implement environment-specific deployments.
* Maintain architecture documentation and deployment evidence.
* Demonstrate enterprise-style Git and GitHub workflows.
* Showcase Terraform dependency management patterns.
* Establish a foundation for future Azure Landing Zone deployments.

---

# Current Status

## Completed

* Repository Structure
* Architecture Documentation
* Development Environment
* Resource Group Module
* Storage Account Module
* Module Validation Framework

## Dependency Patterns Demonstrated

### Resource Group

* Standalone Deployment ✅

### Storage Account

* Standalone Deployment ✅
* Explicit Dependency Pattern ✅
* Implicit Dependency Pattern ✅

---

# Implemented Modules

## Resource Group Module

**Status:** ✅ Completed

### Features

* Multiple Resource Group deployment
* Map-based input structure
* Input validation
* Optional tagging support
* Standardized outputs
* Deployment verification screenshots
* Reusable module design

**Module Location**

```text
modules/resource_group
```

---

## Storage Account Module

**Status:** ✅ Completed

### Features

* Multiple Storage Account deployment
* Map-based input structure
* Input validation
* Optional tagging support
* Standardized outputs
* Explicit dependency demonstration
* Implicit dependency demonstration
* Deployment verification screenshots
* Reusable module design

**Module Location**

```text
modules/storage_account
```

---

# Progress Tracker

| Module                       | Status      |
| ---------------------------- | ----------- |
| Resource Group               | ✅ Completed |
| Storage Account              | ✅ Completed |
| Virtual Network (VNet)       | ⏳ Planned   |
| Subnet                       | ⏳ Planned   |
| Network Security Group (NSG) | ⏳ Planned   |
| Public IP                    | ⏳ Planned   |
| Network Interface (NIC)      | ⏳ Planned   |
| Virtual Machine (VM)         | ⏳ Planned   |

---

# Planned Roadmap

### Networking

* Virtual Network (VNet)
* Subnet
* Network Security Group (NSG)

### Connectivity

* Public IP
* Network Interface (NIC)

### Compute

* Virtual Machine (VM)

---

# Repository Structure

```text
terraform-azure-foundation/
│
├── docs/
│   ├── architecture/
│   ├── diagrams/
│   └── screenshots/
│
├── environments/
│   └── dev/
│
├── modules/
│   ├── resource_group/
│   └── storage_account/
│
├── README.md
├── LICENSE
└── .gitignore
```

---

# Architecture Documentation

Architecture documents, design decisions, dependency patterns, and diagrams are maintained under:

```text
docs/architecture/
```

---

# Deployment Evidence

Deployment verification screenshots, Terraform plans, dependency graphs, and Azure Portal validation screenshots are maintained under:

```text
docs/screenshots/
```

---

# Git Workflow

This repository follows a feature branch workflow.

```text
main
 │
 ├── feature/resource-group
 │      └── Pull Request
 │
 ├── feature/storage-account
 │      └── Pull Request
 │
 ├── feature/storage-account-explicit-dependency
 │      └── Pull Request
 │
 └── feature/storage-account-implicit-dependency
        └── Pull Request
```

All module development is performed through feature branches and merged through Pull Requests.

---

# Terraform Design Principles

* Modular architecture
* Environment-agnostic modules
* Map-based deployments
* Standardized outputs
* Strong input validation
* Optional attributes where appropriate
* Loose coupling through logical keys
* Explicit and implicit dependency patterns
* Reusable infrastructure components

---

# Future Vision

This repository is evolving toward a complete Azure Infrastructure Foundation that will eventually include:

* Networking
* Security Controls
* Compute Resources
* Identity Integration
* Enterprise Terraform Patterns
* Azure Landing Zone Concepts

---

# License

MIT License
