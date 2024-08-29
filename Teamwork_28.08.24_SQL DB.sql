CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary REAL
);

CREATE TABLE departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name TEXT NOT NULL
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_name TEXT NOT NULL,
    department_id INTEGER,
    FOREIGN KEY(department_id) REFERENCES departments(id)
);

-- Inserting data into employees table
INSERT INTO employees (name, position, salary) VALUES ('Alice', 'Developer', 75000);
INSERT INTO employees (name, position, salary) VALUES ('Bob', 'Manager', 90000);
INSERT INTO employees (name, position, salary) VALUES ('Charlie', 'Tester', 60000);

-- Inserting data into departments table
INSERT INTO departments (department_name) VALUES ('Engineering');
INSERT INTO departments (department_name) VALUES ('HR');
INSERT INTO departments (department_name) VALUES ('Marketing');

-- Inserting data into projects table
INSERT INTO projects (project_name, department_id) VALUES ('Project Alpha', 1);
INSERT INTO projects (project_name, department_id) VALUES ('Project Beta', 1);
INSERT INTO projects (project_name, department_id) VALUES ('Project Gamma', 3);

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM projects;
