# Terraform Azure Foundation

Reusable and modular Azure infrastructure deployment using Terraform.

This repository is being developed as a reusable Azure foundation framework following Terraform module design principles, Git feature branch workflows, and infrastructure-as-code best practices.

---

## Project Goals

* Build reusable Terraform modules for Azure resources.
* Follow a modular architecture.
* Implement environment-specific deployments.
* Maintain clear documentation and architecture diagrams.
* Demonstrate enterprise-style Git and GitHub workflows.
* Create a scalable foundation for future Azure infrastructure deployments.

---

## Current Status

### Completed

* Repository Structure
* Architecture Documentation
* Module Design Standards
* Development Environment
* Resource Group Module
* Input Validation
* Module Outputs
* Resource Deployment
* Deployment Verification
* Git Feature Branch Workflow
* Pull Request Workflow

### In Progress

* Storage Account Module

---

## Implemented Modules

### Resource Group Module

Status: ✅ Completed

Features:

* Multiple Resource Group deployment
* Map-based input structure
* Input validation
* Optional tagging support
* Standardized outputs
* Deployment verification screenshots
* Reusable module design

Module Location:

```text
modules/resource_group
```

---

## Planned Modules

* Storage Account
* Virtual Network (VNet)
* Subnet
* Network Security Group (NSG)
* Public IP
* Network Interface (NIC)
* Virtual Machine (VM)

---

## Progress Tracker

| Module          | Status      |
| --------------- | ----------- |
| Resource Group  | ✅ Completed |
| Storage Account | ⏳ Planned   |
| VNet            | ⏳ Planned   |
| Subnet          | ⏳ Planned   |
| NSG             | ⏳ Planned   |
| Public IP       | ⏳ Planned   |
| NIC             | ⏳ Planned   |
| VM              | ⏳ Planned   |

---

## Repository Structure

```text
terraform-azure-foundation/

├── docs/
│   ├── architecture/
│   ├── diagrams/
│   └── screenshots/
│
├── environments/
│   └── dev/
│
├── modules/
│   └── resource_group/
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## Architecture Documentation

Architecture documents, design principles, diagrams, and deployment screenshots are available under:

```text
docs/
```

---

## Screenshots

Deployment verification screenshots are maintained under:

```text
docs/screenshots/
```

---

## Git Workflow

This project follows a feature branch workflow.

Example:

```text
main
 │
 └── feature/resource-group
         │
         ├── commits
         ├── push
         ├── pull request
         └── merge
```

Future modules will be developed using dedicated feature branches and merged through Pull Requests.

---

## Terraform Design Principles

* Modular architecture
* Environment agnostic modules
* Map-based deployments
* Standardized outputs
* Input validation
* Optional attributes where appropriate
* Loose coupling through logical keys
* Reusable infrastructure patterns

---

## License

MIT License
