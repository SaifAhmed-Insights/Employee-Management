# Employee Management System (SQL Project)

A complete **Employee Management System** built using SQL that manages employee data, departments, projects, salaries, and leave records. This project is ideal for practicing database design, SQL queries, and real-world HR data operations.

 Features

     Employee Management

        Add, update, and delete employee records

        Retrieve employee info by department, job title, or project

     Department Management

        List departments with managers

        View employees within each department

     Salary Management

        Store and update salary details

        Generate payroll reports

     Project Management

        Assign employees to projects

        Track project status (Ongoing, Completed, On Hold)

     Leave Management

        Request and approve leave

        Track leave history and generate reports

 Technologies Used

    SQL (MySQL/MariaDB compatible)

    ER Modeling for relational schema design

    Foreign key constraints, ENUMs, JOINs, GROUP BY, and aggregate functions

 Sample Reports

    Payroll summary per department

    Leave history of employees

    Project assignments and status overview

    Department-wise employee listings

---

##  Project Structure

```bash
employee-management-system/
│
├── schema/
│   ├── employees.sql
│   ├── departments.sql
│   ├── projects.sql
│   ├── salaries.sql
│   ├── leaves.sql
│   └── employee_projects.sql
│
├── data/
│   └── insert_sample_data.sql
│
├── reports/
│   ├── employee_queries.sql
│   ├── department_queries.sql
│   ├── salary_reports.sql
│   ├── project_reports.sql
│   └── leave_reports.sql
│
└── README.md
