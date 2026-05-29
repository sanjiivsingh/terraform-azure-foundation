# Module Design Principles

## Input Standards

- Use "name" instead of resource-specific names.
- Use maps for scalable deployments.
- Use optional attributes where possible.

## Output Standards

- Expose name, id, and location.
- Return outputs as maps.

## Relationship Standards

- Use rg_key, vnet_key, subnet_key patterns.

## Tagging Standards

- Tags should be optional.
- Tags should be passed directly to resources.