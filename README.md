# Tea Estate SQL & Power BI Data Analysis Project

This project is a personal learning exercise where I designed a relational PostgreSQL database, built a normalized data model, and visualized tea estate operations using Power BI. The goal was to gain hands-on experience with SQL, database design, and interactive dashboarding/reporting.

---

## Project Overview

This end-to-end project simulates a real-world tea estate's data system. It includes:-

- 🛠️ **PostgreSQL**: Relational schema with normalized tables
- 📊 **Power BI**: Data model and reports visualizing operations
- 📂 **ETL Concepts**: Basic cleaning and transformation of raw data
- 📁 **CSV Integration**: Initial data loaded from a manually cleaned CSV file

---

## Technologies Used

| Tool           | Purpose                         |
|----------------|----------------------------------|
| PostgreSQL     | Backend database |
| Power BI       | Data Model, Reporting and visuals |
| DAX & SQL      | Metrics, transformations, querying |
| GitHub         | Version control and documentation |
| Excel  | CSV cleanup and formatting        |

---

## Data Model Design

The system models core tea estate operations, including -

###  Dimension Tables
- `employee` – List of all staff (pluckers, workers)
- `extra_expenses` – Types of operational costs

###  Fact Tables
- `salary` – Employee salary payments
- `tea_plucking` – Wages for tea plucking tasks
- `tea_plants` – Expenses for buying tea plants
- `expenses` – Machinery and miscellaneous costs
- `revenue` – Monthly income from selling tea leaves

###  Calendar Table
- A custom Date table is created in Power BI for time intelligence analysis and proper slicing of data.

---

## 📈 Power BI Report Features

-  Monthly Income vs Expenses trends
-  Tea Leaves Harvested by Month
-  Salary distribution by employee
-  Extra Expense breakdown
-  Filtering by employee, time period, expense type

---

## 🔄 ETL Process

- Raw CSV data was pre-processed to:
  - Strip `LKR` and commas from currency fields
  - Convert month names to proper `DATE` format (e.g., `'January'` → `'2024-01-01'`)
- Data then loaded into PostgreSQL using `COPY` command
- Relationships established in Power BI data model


