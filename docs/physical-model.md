# Physical Model

## Overview
The physical model implements the logical model in PostgreSQL with specific data types, constraints, and indexes.

![Physical ERD](models/physical-erd.png)

## Database: PostgreSQL

## Constraints

### Primary Keys
All tables use surrogate keys (INTEGER, manually assigned in seed data)

### Foreign Keys
All foreign keys have referential integrity constraints

### Unique Constraints
- Single-column unique for 1:1 relationships and natural keys
- Composite unique for bridge tables to prevent duplicates

### Check Constraints
- Teacher.contract_type IN ('consultant', 'permanent_hire')

## Normalization - 3NF Compliance

### 1NF
- All tables have primary keys
- All columns contain atomic values
- No repeating groups (M:M handled via bridge tables)

### 2NF
- All tables use single-column primary keys (no composite keys)
- No partial dependencies possible

### 3NF
- No transitive dependencies
- Each non-key attribute depends directly on the primary key

## DBML Code
[Physical model (DBML)](models/physical-model.dbml)

## Physical ERD
[Physical ERD - generated from DBML](models/physical-erd.png)