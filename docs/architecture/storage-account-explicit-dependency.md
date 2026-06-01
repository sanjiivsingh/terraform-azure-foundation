Purpose
-------
Demonstrate explicit Terraform dependencies using depends_on.

Architecture
------------
Resource Group Module
        │
        ▼
Storage Account Module

Dependency Type
---------------
Explicit Dependency

Implementation
--------------
depends_on = [
  module.resource_group
]

Advantages
----------
- Easy to understand
- Useful when no attribute reference exists

Disadvantages
-------------
- Creates unnecessary coupling
- Usually not required when outputs are referenced

Recommendation
--------------
Prefer implicit dependencies whenever possible.
Use depends_on only when Terraform cannot infer the dependency.