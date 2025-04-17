CREATE DATABASE EmployeeDB;

USE EmployeeDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManagerID INT
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    BaseSalary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY,
    EmployeeID INT,
    OldTitle VARCHAR(50),
    NewTitle VARCHAR(50),
    OldSalary DECIMAL(10, 2),
    NewSalary DECIMAL(10, 2),
    PromotionDate DATE,
    PromotionNotes VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE TimeTracking (
    TimeEntryID INT PRIMARY KEY,
    EmployeeID INT,
    ClockIn DATETIME,
    ClockOut DATETIME,
    TotalHours DECIMAL(5, 2) GENERATED ALWAYS AS (TIMESTAMPDIFF(MINUTE, ClockIn, ClockOut) / 60),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID)
VALUES 
    (1, 'HR', 101),
    (2, 'IT', 102),
    (3, 'Finance', 103),
    (4, 'Marketing', 104),
    (5, 'Sales', 105),
    (6, 'Operations', 106),
    (7, 'Customer Service', 107),
    (8, 'Legal', 108),
    (9, 'R&D', 109),
    (10, 'Logistics', 110),
    (11, 'Procurement', 111),
    (12, 'Security', 112),
    (13, 'Compliance', 113),
    (14, 'Public Relations', 114),
    (15, 'Administration', 115),
    (16, 'Training', 116),
    (17, 'Quality Control', 117),
    (18, 'Engineering', 118),
    (19, 'Product Management', 119),
    (20, 'Business Intelligence', 120);
    
   INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate, Salary)
VALUES 
    (101, 'Emily', 'Johnson', 1, '2020-02-15', 55000),
    (102, 'Michael', 'Boateng', 2, '2019-07-20', 60000),
    (103, 'Sarah', 'Otoo', 3, '2018-03-10', 75000),
    (104, 'Kobina', 'Seame', 4, '2017-06-25', 72000),
    (105, 'Emmanuel', 'Willams', 5, '2021-01-15', 50000),
    (106, 'Frank', 'Acheampong', 6, '2020-11-30', 63000),
    (107, 'Grace', 'Baba', 7, '2016-09-05', 54000),
    (108, 'Henry', 'Asante', 8, '2015-07-19', 82000),
    (109, 'Isabella', 'Boamah', 9, '2019-04-11', 91000),
    (110, 'Afua', 'Yeboah', 10, '2018-12-22', 48000),
    (111, 'Katherine', 'Okyere', 11, '2020-05-01', 58000),
    (112, 'Shauntee', 'Ofori', 12, '2017-08-14', 57000),
    (113, 'Kosi', 'Tetteh', 13, '2016-10-10', 75000),
    (114, 'Gyasi', 'Osei', 14, '2021-02-17', 62000),
    (115, 'Olivia', 'Mensah', 15, '2019-06-23', 71000),
    (116, 'Patrick', 'Attah', 16, '2018-09-29', 65000),
    (117, 'Enam', 'Bonsu', 17, '2017-07-07', 56000),
    (118, 'Ryan', 'Boadu', 18, '2020-10-13', 88000),
    (119, 'Amma', 'Adom', 19, '2019-03-31', 74000),
    (120, 'Thomas', 'Aidoo', 20, '2015-05-16', 78000); 
    
    
    
    INSERT INTO Salaries (SalaryID, EmployeeID, BaseSalary, Bonus, EffectiveDate)
VALUES 
    (1, 101, 55000, 5000, '2022-01-01'),
    (2, 102, 60000, 8000, '2022-01-01'),
    (3, 103, 75000, 10000, '2022-01-01'),
    (4, 104, 72000, 9500, '2022-01-01'),
    (5, 105, 50000, 4000, '2022-01-01'),
    (6, 106, 63000, 7000, '2022-01-01'),
    (7, 107, 54000, 4500, '2022-01-01'),
    (8, 108, 82000, 12000, '2022-01-01'),
    (9, 109, 91000, 13000, '2022-01-01'),
    (10, 110, 48000, 3500, '2022-01-01'),
    (11, 111, 58000, 6000, '2022-01-01'),
    (12, 112, 57000, 5900, '2022-01-01'),
    (13, 113, 75000, 9000, '2022-01-01'),
    (14, 114, 62000, 7500, '2022-01-01'),
    (15, 115, 71000, 8700, '2022-01-01'),
    (16, 116, 65000, 7200, '2022-01-01'),
    (17, 117, 56000, 5000, '2022-01-01'),
    (18, 118, 88000, 11000, '2022-01-01'),
    (19, 119, 74000, 8900, '2022-01-01'),
    (20, 120, 78000, 9500, '2022-01-01');
    
    
INSERT INTO Promotions (PromotionID, EmployeeID, OldTitle, NewTitle, OldSalary, NewSalary, PromotionDate, PromotionNotes)
VALUES 
    (1, 101, 'HR Assistant', 'HR Specialist', 55000, 65000, '2023-01-15', 'Promoted due to exceptional performance'),
    (2, 102, 'Junior Developer', 'Developer', 60000, 70000, '2023-02-20', 'Recognized for technical skills improvement'),
    (3, 103, 'Financial Analyst', 'Senior Financial Analyst', 75000, 85000, '2023-03-10', 'Promoted for outstanding financial management'),
    (4, 104, 'Marketing Coordinator', 'Marketing Manager', 72000, 82000, '2023-04-05', 'Leadership potential demonstrated'),
    (5, 105, 'Sales Representative', 'Senior Sales Representative', 50000, 60000, '2023-05-01', 'Exceeded sales targets consistently'),
    (6, 106, 'Operations Associate', 'Operations Manager', 63000, 75000, '2023-06-18', 'Promoted for process optimization efforts'),
    (7, 107, 'Customer Service Rep', 'Customer Service Supervisor', 54000, 64000, '2023-07-22', 'Exceptional customer handling skills'),
    (8, 108, 'Legal Assistant', 'Legal Advisor', 82000, 95000, '2023-08-30', 'Key role in corporate legal strategies'),
    (9, 109, 'R&D Associate', 'R&D Manager', 91000, 102000, '2023-09-15', 'Successful leadership in research projects'),
    (10, 110, 'Logistics Coordinator', 'Logistics Manager', 48000, 58000, '2023-10-10', 'Streamlined logistics operations effectively'),
    (11, 111, 'Procurement Assistant', 'Procurement Specialist', 58000, 68000, '2023-11-12', 'Improved supplier relations and cost savings'),
    (12, 112, 'Security Officer', 'Security Supervisor', 57000, 67000, '2023-12-01', 'Ensured top-tier security standards'),
    (13, 113, 'Compliance Analyst', 'Compliance Manager', 75000, 87000, '2023-12-20', 'Key role in policy compliance improvements'),
    (14, 114, 'PR Associate', 'PR Manager', 62000, 73000, '2024-01-05', 'Enhanced company reputation and outreach'),
    (15, 115, 'Administrative Assistant', 'Office Manager', 71000, 82000, '2024-01-15', 'Promoted for administrative efficiency'),
    (16, 116, 'Training Coordinator', 'Training Manager', 65000, 76000, '2024-02-01', 'Developed effective employee training programs'),
    (17, 117, 'Quality Analyst', 'Quality Control Manager', 56000, 66000, '2024-02-10', 'Promoted for enhancing product quality standards'),
    (18, 118, 'Junior Engineer', 'Senior Engineer', 88000, 99000, '2024-03-01', 'Advanced technical expertise and leadership'),
    (19, 119, 'Product Associate', 'Product Manager', 74000, 86000, '2024-03-15', 'Strong contributions to product development'),
    (20, 120, 'BI Analyst', 'BI Manager', 78000, 89000, '2024-04-01', 'Data-driven decision-making excellence');


INSERT INTO TimeTracking (TimeEntryID, EmployeeID, ClockIn, ClockOut)
VALUES 
    (1, 101, '2024-11-01 08:00:00', '2024-11-01 16:30:00'),
    (2, 101, '2024-11-02 08:15:00', '2024-11-02 17:00:00'),
    (3, 102, '2024-11-01 09:00:00', '2024-11-01 18:00:00'),
    (4, 102, '2024-11-02 09:05:00', '2024-11-02 17:30:00'),
    (5, 103, '2024-11-01 07:45:00', '2024-11-01 16:00:00'),
    (6, 103, '2024-11-02 08:10:00', '2024-11-02 16:45:00'),
    (7, 104, '2024-11-01 08:30:00', '2024-11-01 17:15:00'),
    (8, 104, '2024-11-02 08:45:00', '2024-11-02 17:20:00'),
    (9, 105, '2024-11-01 09:00:00', '2024-11-01 18:00:00'),
    (10, 105, '2024-11-02 09:15:00', '2024-11-02 17:45:00'),
    (11, 106, '2024-11-01 07:30:00', '2024-11-01 15:45:00'),
    (12, 106, '2024-11-02 07:45:00', '2024-11-02 16:00:00'),
    (13, 107, '2024-11-01 08:00:00', '2024-11-01 16:30:00'),
    (14, 107, '2024-11-02 08:20:00', '2024-11-02 16:45:00'),
    (15, 108, '2024-11-01 09:00:00', '2024-11-01 18:00:00'),
    (16, 108, '2024-11-02 09:30:00', '2024-11-02 18:15:00'),
    (17, 109, '2024-11-01 07:45:00', '2024-11-01 16:15:00'),
    (18, 109, '2024-11-02 08:10:00', '2024-11-02 16:50:00'),
    (19, 110, '2024-11-01 08:15:00', '2024-11-01 17:00:00'),
    (20, 110, '2024-11-02 08:30:00', '2024-11-02 17:30:00');
