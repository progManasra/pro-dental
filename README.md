# ProDental – Clinic Management System

ProDental is a full-stack clinic management system that handles users, schedules, and appointments with role-based access (Admin, Doctor, Patient).

## System Architecture Overview

------------------------------------------------------------------------------

pro-dental/
│
├── backend/
├── frontend/
├── CONTRIBUTING.md
├── BRANCHING.md
└── README.md   ← وصف النظام


----------------------------------------------------------------------------
            ┌───────────────────────┐
            │      Flutter App      │
            │  (Frontend - Mobile)  │
            └──────────┬────────────┘
                       │ REST API (HTTP)
                       ▼
            ┌───────────────────────┐
            │  Node.js + Express    │
            │      Backend API      │
            └──────────┬────────────┘
                       │ SQL Queries
                       ▼
            ┌───────────────────────┐
            │        MySQL DB       │
            │ users, schedules, appts │
            └───────────────────────┘

------------------------------------------------------------------------------
### Layers

| Layer | Technology | Responsibility |
|------|------------|----------------|
| Frontend | Flutter | UI, user interaction, API calls |
| Backend | Node.js + Express | Business logic, validation, RBAC |
| Database | MySQL | Persistent data storage |

---

## Roles

| Role | Permissions |
|------|-------------|
| Admin | Manage users, schedules, daily board |
| Doctor | View appointments, update status |
| Patient | Book appointments |

------------------------------------------------------------------------------


------------------------------------------------------------------------------


------------------------------------------------------------------------------


------------------------------------------------------------------------------


------------------------------------------------------------------------------


------------------------------------------------------------------------------


------------------------------------------------------------------------------
