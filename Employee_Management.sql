CREATE DATABASE EM;

USE EM;

CREATE TABLE employees (
employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone_number VARCHAR(15),
hire_date DATE NOT NULL,
job_title VARCHAR(50) NOT NULL,
department_id INT
);

ALTER TABLE employees
ADD CONSTRAINT department_id
FOREIGN KEY (department_id) REFERENCES departments(department_id);

DELETE FROM employees
WHERE first_name = 'Aiden';

UPDATE employees
SET last_name = 'Clarc'
WHERE employee_id = 7;



SET SQL_SAFE_UPDATES = 0;


INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id)
VALUES ('Aiden', 'Williams', 'aiden.williams@example.com', '987-654-3210', '2023-01-10', 'Data Scientist', 1);



INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id) 
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2020-05-15', 'Software Engineer', 1),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '2019-08-20', 'Project Manager', 2),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', '2018-02-10', 'HR Specialist', 3),
('Bob', 'Davis', 'bob.davis@example.com', '555-234-5678', '2021-01-22', 'Data Analyst', 4),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-345-6789', '2017-11-05', 'Marketing Director', 5),
('David', 'Wilson', 'david.wilson@example.com', '555-456-7890', '2022-06-30', 'Product Manager', 6),
('Emily', 'Clark', 'emily.clark@example.com', '555-567-8901', '2019-09-17', 'UI/UX Designer', 7),
('Frank', 'Martinez', 'frank.martinez@example.com', '555-678-9012', '2020-04-12', 'Operations Manager', 8),
('Grace', 'Garcia', 'grace.garcia@example.com', '555-789-0123', '2021-03-18', 'Financial Analyst', 9),
('Hannah', 'Lopez', 'hannah.lopez@example.com', '555-890-1234', '2018-07-27', 'Customer Support Lead', 10);


CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
department_name VARCHAR(100),
manager_id INT NOT NULL,
FOREIGN KEY (manager_id) References employees(employee_id)
);

INSERT INTO departments (department_name, manager_id)
VALUES
('Engineering', 1),  -- John Doe is the manager (employee_id 1)
('Project Management', 2),  -- Jane Smith is the manager (employee_id 2)
('Human Resources', 3),  -- Alice Johnson is the manager (employee_id 3)
('Data Analysis', 4),  -- Bob Davis is the manager (employee_id 4)
('Marketing', 5),  -- Charlie Brown is the manager (employee_id 5)
('Product Management', 6),  -- David Wilson is the manager (employee_id 6)
('Design', 7),  -- Emily Clark is the manager (employee_id 7)
('Operations', 8),  -- Frank Martinez is the manager (employee_id 8)
('Finance', 9),  -- Grace Garcia is the manager (employee_id 9)
('Customer Support', 10);  -- Hannah Lopez is the manager (employee_id 10)

CREATE TABLE salaries (
salary_id INT PRIMARY KEY AUTO_INCREMENT, 
employee_id INT,
basic_salary DECIMAL (10,2),
bonus DECIMAL (10,2),
total_salary DECIMAL (10,2),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO salaries (employee_id, basic_salary, bonus, total_salary)
VALUES
(1, 50000.00, 5000.00, 55000.00),  -- John Doe
(2, 60000.00, 6000.00, 66000.00),  -- Jane Smith
(3, 45000.00, 4500.00, 49500.00),  -- Alice Johnson
(4, 55000.00, 5500.00, 60500.00),  -- Bob Davis
(5, 70000.00, 7000.00, 77000.00),  -- Charlie Brown
(6, 65000.00, 6500.00, 71500.00),  -- David Wilson
(7, 48000.00, 4800.00, 52800.00),  -- Emily Clark
(8, 56000.00, 5600.00, 61600.00),  -- Frank Martinez
(9, 75000.00, 7500.00, 82500.00),  -- Grace Garcia
(10, 40000.00, 4000.00, 44000.00);  -- Hannah Lopez

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    status ENUM('Ongoing', 'Completed', 'On Hold') NOT NULL
);

INSERT INTO projects (project_name, start_date, end_date, status)
VALUES
('Project Alpha', '2023-01-15', '2023-06-15', 'Completed'),
('Project Beta', '2023-03-20', NULL, 'Ongoing'),
('Project Gamma', '2023-04-10', '2023-10-30', 'Completed'),
('Project Delta', '2023-06-01', NULL, 'Ongoing'),
('Project Epsilon', '2023-07-15', '2023-11-30', 'Completed'),
('Project Zeta', '2023-08-01', NULL, 'On Hold'),
('Project Eta', '2023-09-10', '2023-12-25', 'Completed'),
('Project Theta', '2023-10-05', NULL, 'Ongoing'),
('Project Iota', '2023-11-01', NULL, 'Ongoing'),
('Project Kappa', '2023-12-15', '2024-06-15', 'Completed');

CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    assigned_date DATE NOT NULL,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO employee_projects (employee_id, project_id, assigned_date)
VALUES
(1, 1, '2023-01-15'),  -- John Doe assigned to Project Alpha
(2, 2, '2023-03-20'),  -- Jane Smith assigned to Project Beta
(3, 3, '2023-04-10'),  -- Alice Johnson assigned to Project Gamma
(4, 4, '2023-06-01'),  -- Bob Davis assigned to Project Delta
(5, 5, '2023-07-15'),  -- Charlie Brown assigned to Project Epsilon
(6, 6, '2023-08-01'),  -- David Wilson assigned to Project Zeta
(7, 7, '2023-09-10'),  -- Emily Clark assigned to Project Eta
(8, 8, '2023-10-05'),  -- Frank Martinez assigned to Project Theta
(9, 9, '2023-11-01'),  -- Grace Garcia assigned to Project Iota
(10, 10, '2023-12-15');  -- Hannah Lopez assigned to Project Kappa

CREATE TABLE leaves (
leave_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employee_id INT NOT NULL,
leave_type ENUM('Sick', 'Casual', 'Paid', 'Unpaid') NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
status ENUM('Pending', 'Approved', 'Rejected') NOT NULL,
FOREIGN KEY (employee_id) References employees(employee_id)
);

INSERT INTO leaves (employee_id, leave_type, start_date, end_date, status)
VALUES
(1, 'Sick', '2023-06-01', '2023-06-03', 'Approved'),  -- John Doe
(2, 'Casual', '2023-07-10', '2023-07-12', 'Pending'),  -- Jane Smith
(3, 'Paid', '2023-08-15', '2023-08-17', 'Approved'),  -- Alice Johnson
(4, 'Unpaid', '2023-09-05', '2023-09-10', 'Rejected'),  -- Bob Davis
(5, 'Sick', '2023-10-01', '2023-10-03', 'Approved'),  -- Charlie Brown
(6, 'Casual', '2023-11-20', '2023-11-22', 'Pending'),  -- David Wilson
(7, 'Paid', '2023-12-01', '2023-12-05', 'Approved'),  -- Emily Clark
(8, 'Unpaid', '2023-12-10', '2023-12-15', 'Rejected'),  -- Frank Martinez
(9, 'Sick', '2024-01-05', '2024-01-07', 'Approved'),  -- Grace Garcia
(10, 'Casual', '2024-02-15', '2024-02-17', 'Pending');  -- Hannah Lopez

-- Employee Management**: Add, update, delete employee records, retrieve employee details based on department, job title, or project.
-- Add Employee Record
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department_id)
VALUES ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-01', 'Software Engineer', 1);

-- Update Employee Record
UPDATE employees
SET job_title = 'Senior Software Engineer', department_id = 2
WHERE employee_id = 1;

-- Delete Employee Record
DELETE FROM employees
WHERE employee_id = 1;

-- Retrieve Employee Details Based on Department
SELECT e.employee_id, e.first_name, e.last_name, e.email, e.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

-- Retrieve Employee Details Based on Job Title
SELECT employee_id, first_name, last_name, email, job_title
FROM employees
WHERE job_title = 'Software Engineer';

-- Retrieve Employee Details Based on Project
SELECT e.employee_id, e.first_name, e.last_name, e.email, p.project_name
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE p.project_name = 'Project Alpha';

-- Department Management**: List departments with their managers, show employees within a department
-- List Departments with Their Managers
SELECT d.department_id, d.department_name, 
       e.first_name AS manager_first_name, e.last_name AS manager_last_name, e.email AS manager_email
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id;

-- Show Employees Within a Specific Department
SELECT e.employee_id, e.first_name, e.last_name, e.email, e.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

SELECT d.department_name, e.employee_id, e.first_name, e.last_name, e.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- *Salary Management**: Store and update salary records, generate payroll reports for employees
-- Store (Insert) Salary Records
INSERT INTO salaries (employee_id, basic_salary, bonus, total_salary)
VALUES (1, 6000.00, 500.00, 6500.00);

-- Update Salary Records
UPDATE salaries
SET basic_salary = 6500.00,
    bonus = 600.00,
    total_salary = 7100.00
WHERE employee_id = 1;

-- Generate Payroll Report for All Employees
SELECT e.employee_id, 
       CONCAT(e.first_name, ' ', e.last_name) AS full_name, 
       e.job_title, 
       s.basic_salary, 
       s.bonus, 
       s.total_salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
ORDER BY e.employee_id;

-- Generate Payroll Report for a Specific Department
SELECT d.department_name, 
       e.employee_id, 
       CONCAT(e.first_name, ' ', e.last_name) AS full_name, 
       e.job_title, 
       s.basic_salary, 
       s.bonus, 
       s.total_salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

-- *Project Management**: Assign employees to projects, track project progress and completion status
-- Assign Employees to Projects
INSERT INTO employee_projects (employee_id, project_id, assigned_date)
VALUES (1, 2, '2024-04-01');

INSERT INTO employee_projects (employee_id, project_id, assigned_date)
VALUES 
(2, 2, '2024-04-01'),
(3, 3, '2024-04-02');

-- Track Project Progress and Completion
-- Mark project as 'Completed'
UPDATE projects
SET status = 'Completed', end_date = CURDATE()
WHERE project_id = 2;

-- Put a project on hold
UPDATE projects
SET status = 'On Hold'
WHERE project_id = 3;

-- View Assigned Employees per Project
SELECT p.project_name, p.status, e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name, ep.assigned_date
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
JOIN employees e ON ep.employee_id = e.employee_id
ORDER BY p.project_id;

-- View Projects by Status (e.g., Ongoing)
SELECT * 
FROM projects 
WHERE status = 'Ongoing';

-- List All Projects with Number of Assigned Employees
SELECT p.project_id, p.project_name, p.status, COUNT(ep.employee_id) AS total_employees
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name, p.status;

-- List All Projects for a Specific Employee
SELECT p.project_name, p.status, ep.assigned_date
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
WHERE ep.employee_id = 1;

-- Leave Management**: Request leave and track approval status, generate reports on leave history
-- Requesting Leave
INSERT INTO leaves (employee_id, leave_type, start_date, end_date, status)
VALUES (1, 'Sick', '2025-04-10', '2025-04-12', 'Pending');

-- Update Leave Approval Status
UPDATE leaves
SET status = 'Approved'
WHERE leave_id = 1;

-- Track Leave Requests with Current Status
SELECT l.leave_id, e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       l.leave_type, l.start_date, l.end_date, l.status
FROM leaves l
JOIN employees e ON l.employee_id = e.employee_id
ORDER BY l.start_date DESC;

-- Generate Leave History Report for One Employee
SELECT leave_type, start_date, end_date, status
FROM leaves
WHERE employee_id = 1
ORDER BY start_date DESC;

-- Generate Leave Report for All Employees
SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       l.leave_type, l.start_date, l.end_date, l.status
FROM leaves l
JOIN employees e ON l.employee_id = e.employee_id
ORDER BY l.start_date DESC;

-- Summary of Leave Requests by Status
SELECT status, COUNT(*) AS total_requests
FROM leaves
GROUP BY status;

-- Total Leave Days Taken per Employee (Approved Only)
SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       SUM(DATEDIFF(l.end_date, l.start_date) + 1) AS total_leave_days
FROM leaves l
JOIN employees e ON l.employee_id = e.employee_id
WHERE l.status = 'Approved'
GROUP BY e.employee_id;