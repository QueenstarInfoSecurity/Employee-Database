# EmployeeDB – SQL Employee Management System

Welcome to **EmployeeDB**, a comprehensive SQL-based system for managing company departments, employees, promotions, salaries, and attendance tracking. This project is ideal for HR operations, payroll analysis, and organizational reporting.



##  What's Inside?

This project sets up a relational database in **MySQL** with realistic sample data to simulate a full-scale employee management system. It's perfect for learning, testing, and prototyping HR tools or dashboards.



##  Database Design

The schema is normalized and follows best practices for referential integrity and scalability. Here’s a breakdown:

### Departments
Stores department names and the ID of the department head.

| Column         | Type        | Description                  |
|----------------|-------------|------------------------------|
| DepartmentID   | INT (PK)    | Unique ID                    |
| DepartmentName | VARCHAR(100)| Name of the department       |
| ManagerID      | INT         | References `EmployeeID`      |



###  Employees
Central table for employee records.

| Column      | Type         | Description                     |
|-------------|--------------|---------------------------------|
| EmployeeID  | INT (PK)     | Unique employee ID              |
| FirstName   | VARCHAR(50)  | Employee's first name           |
| LastName    | VARCHAR(50)  | Employee's last name            |
| DepartmentID| INT (FK)     | Links to `Departments`          |
| HireDate    | DATE         | When the employee was hired     |
| Salary      | DECIMAL      | Current salary (base)           |



###  Salaries
Tracks changes in employee compensation.

| Column       | Type         | Description                    |
|--------------|--------------|--------------------------------|
| SalaryID     | INT (PK)     | Unique ID                      |
| EmployeeID   | INT (FK)     | Refers to `Employees`          |
| BaseSalary   | DECIMAL      | Base annual salary             |
| Bonus        | DECIMAL      | Annual bonus                   |
| EffectiveDate| DATE         | Date salary became active      |



###  Promotions
Logs title and salary changes over time.

| Column         | Type         | Description                          |
|----------------|--------------|--------------------------------------|
| PromotionID    | INT (PK)     | Unique ID                            |
| EmployeeID     | INT (FK)     | Refers to `Employees`                |
| OldTitle       | VARCHAR(50)  | Previous job title                   |
| NewTitle       | VARCHAR(50)  | New job title                        |
| OldSalary      | DECIMAL      | Previous salary                      |
| NewSalary      | DECIMAL      | New salary after promotion           |
| PromotionDate  | DATE         | Date of promotion                    |
| PromotionNotes | VARCHAR(255) | Optional notes on promotion reason   |



###  TimeTracking
Logs daily clock-in/clock-out with total hours calculated automatically.

| Column      | Type          | Description                                   |
|-------------|---------------|-----------------------------------------------|
| TimeEntryID | INT (PK)      | Unique log ID                                 |
| EmployeeID  | INT (FK)      | Refers to `Employees`                         |
| ClockIn     | DATETIME      | Clock-in time                                 |
| ClockOut    | DATETIME      | Clock-out time                                |
| TotalHours  | DECIMAL       | Auto-calculated via TIMESTAMPDIFF (minutes to hours) |



##  Sample Data

The script includes:
- 20 Departments  
- 20 Employees  
- 20 Salary Records  
- 20 Promotion Logs  
- 20+ Time Entries  

This makes it easy to jump into queries, reports, and dashboards right away.



##  How to Use

### 1. Clone the repo
### 2. Load the script
Use SQL environment ( MySQL Workbench, DBeaver, or CLI) and run the SQL file.

## Requirement
- MySQL 8.0+
- Any SQL client

## Design Highligts
- Foreign keys maintain referential integrity across the schema.
- Calculate columns like `TotalHours` reduce manual labour
- Modular design supports integration with HR apps, BI dashboadrs or payroll systems.
  
## License
  Licensed under the MIT lincense.

## ** Disclaimer:**
This project is provided **as is**, without any warranties or guarantees. The author assumes **no responsibility** for any issues, damages,or legal consequences arising from the use of this content. Users should consult legal professionals before implementing any contractual or security related clauses.  

