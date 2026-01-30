# Logical Data Model

## Overview
The logical model adds attributes, keys, and preliminary data types to the conceptual model. Many-to-many relationships are resolved using bridge tables.

## Logical ERD
![Logical ERD](models/logical-erd.png)

## Key Design Decisions
- Surrogate keys used for all primary keys
- Bridge tables use single-column PKs (not composite)
- Sensitive information separated into dedicated tables
