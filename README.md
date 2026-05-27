# Real Estate Property Management System

A Salesforce-based Real Estate Property Management application built using:

- Salesforce Lightning Web Components (LWC)
- Apex Classes & Triggers
- Salesforce Flows
- Reports & Dashboards

---

# Features Implemented

## 1. Property Management

Implemented a complete Property Management module to track property details.

### Property Fields

- Property Name
- Address
- City
- State
- Postal Code
- Country
- Type (Residential / Commercial)
- Furnishing Status (Furnished / Semi-Furnished / Unfurnished)
- Status (Available / Occupied)
- Rent
- Description
- Image Upload Support

### Functionalities

- Create Property using LWC form
- Upload property images/files
- Property listing using Lightning Datatable
- Server-side pagination (25 records per page)
- Filters implemented for:
  - Price
  - Availability Status
  - Furnishing Status

---

# 2. Tenant Management

Implemented Tenant Management module.

### Tenant Fields

- Name
- Phone Number
- Email

### Functionalities

- Tenant creation
- Tenant list view using LWC
- Property-Tenant assignment support

---

# 3. Property Assignment Automation

Implemented automation when a property is assigned to a tenant.

### Automation

When a `Property_Tenant__c` record is created:

- Automatically creates a Salesforce Task
- Task reminder generated for Lease Agreement creation

### Technologies Used

- Record Triggered Flow
- Task Automation

---

# 4. Lease Agreement Management

Implemented Lease Agreement Management module.

### Lease Agreement Fields

- Terms
- Agreed Monthly Rent
- Start Date
- End Date
- Property Lookup
- Tenant Lookup

### Functionalities

- Lease Agreement creation using LWC
- Lease Agreement list view using Lightning Datatable
- Automatic refresh after record creation
- Property and Tenant relationship handling

### Business Logic

- One Lease Agreement is linked to only one Property
- Relationship enforced using Lookup relationship

---

# 5. Automated Lease Expiry Reminder

Implemented scheduled email reminder automation.

### Functionality

- Sends automated email reminder
- Triggered 30 days before lease expiry

### Technologies Used

- Scheduled Flow
- Send Email Action

---

# 6. Vendor Management

Implemented Vendor Management module.

### Vendor Fields

- Name
- Phone Number
- Email

---

# 7. Maintenance Request Management

Implemented Maintenance Request tracking system.

### Maintenance Request Fields

- Property
- Vendor
- Status
  - Open
  - In Progress
  - Completed
  - Cancelled
- Description

---

# 8. Automatic Vendor Assignment

Implemented automatic vendor assignment logic.

### Functionality

When a Maintenance Request is created:

- System automatically assigns Vendor
- Vendor with least workload is selected

### Technologies Used

- Apex Trigger
- Apex Controller
- Aggregate Queries
- Bulkified Logic

### Bulk Handling

The implementation supports bulk operations efficiently using:

- Single SOQL Queries
- Aggregate Queries
- Bulk-safe loops

---

# 9. Reports & Dashboards

Created Salesforce Reports and Dashboard components.

### Reports Implemented

1. Lease Agreements Expiring in Next 30 Days
2. Maintenance Requests Grouped by Status
3. Occupancy Rate Report

### Dashboard Components

- Lease Expiry Tracking
- Maintenance Status Overview
- Occupancy Analytics

---

# 10. Lightning Web Components (LWC)

Developed reusable LWC components for:

- Property Creation
- Tenant Creation
- Lease Creation
- Property Listing
- Tenant Listing
- Lease Agreement Listing

### Features

- Lightning Datatable
- Toast Notifications
- Responsive Layouts
- Dynamic Data Refresh
- Record Forms

---

# 11. Salesforce Flows

Implemented multiple Salesforce Flows:

- Record Triggered Flow
- Scheduled Flow
- Task Automation Flow
- Lease Expiry Reminder Flow

---

# 12. Apex Development

Implemented Apex logic for:

- Vendor Auto Assignment
- Lease Agreement Data Fetching
- Server-side Pagination
- Bulk-safe Processing

---

# 13. Validation & Business Rules

Implemented business validations and data relationships.

### Examples

- Mandatory property fields
- Required image upload
- Lease Agreement relationship validation
- Property assignment handling

---

# 14. Testing

Implemented Apex Test Classes.

### Coverage

- Minimum 80% Apex Test Coverage achieved

### Test Areas

- Trigger Testing
- Controller Testing
- Vendor Assignment Logic
- Lease Agreement Logic

---

# Technologies Used

- Salesforce Lightning Experience
- Lightning Web Components (LWC)
- Apex
- SOQL
- Salesforce Flow Builder
- Lightning App Builder
- Salesforce Reports & Dashboards

---
