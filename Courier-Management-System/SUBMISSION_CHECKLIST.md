# Submission checklist (maps to the portal stories)

| Portal epic | Where it is done |
|---|---|
| Salesforce Account | Create a free Developer Edition org at developer.salesforce.com/signup and activate it from the email |
| Objects (6) | `force-app/.../objects` – deployed |
| Tabs (6) | `force-app-ui/.../tabs` – deployed |
| Fields & Relationships | `force-app/.../objects/*/fields` – deployed |
| Validation Rules | `force-app/.../validationRules` – deployed |
| Page Layouts | **Manual** (see below) |
| Flows | `force-app/.../flows` – deployed |
| Lightning App | `force-app-ui/.../applications` – deployed |
| Profiles (4) | `force-app-ui/.../profiles` – deployed |
| Roles (4) | `force-app-ui/.../roles` – deployed |
| Users | **Manual** (see below) |
| Reports & Dashboards | `force-app-analytics` – deployed; Report Types **manual** |

## Manual steps (about 30 minutes)

### Users (Setup → Users → New User) – make 4, with a real email
| Name | Role | Profile |
|---|---|---|
| Admin Test | Courier Admin | System Administrator |
| Manager Test | Branch Manager | Branch Manager |
| Agent Test | Delivery Agent | Delivery Agent |
| Support Test | Customer Support | Customer Support |

### Page layouts (Setup → Object Manager → each object → Page Layouts → edit)
Drag key fields to the top section, add the related lists (Shipment: Delivery Updates, Invoices; Customer: Shipments; Branch: Delivery Agents, Shipments), and save. Take a screenshot.

### Report types (Setup → Report Types → New Custom Report Type)
1. *Shipments with Delivery Updates*: primary object Shipments, related object Delivery Updates (A to B related, with or without), category Other, Deployed.
2. *Shipments with Invoices*: same with Invoices.

## Before submitting
- [ ] Demo link + GitHub link added in the portal
- [ ] Screenshots uploaded to the repo
- [ ] Kanban stories moved to Done
