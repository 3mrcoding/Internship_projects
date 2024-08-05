-- Create a new database
CREATE DATABASE IF NOT EXISTS EMS;

-- Use the created database
USE EMS;

-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Create the employees table without the foreign key constraint
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_no VARCHAR(20) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hiring_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salary INT NOT NULL,
    rating FLOAT DEFAULT 0.0,
    gender VARCHAR(10) NOT NULL,
    manager_id INT
);

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(250),
    password VARCHAR(250),
    role VARCHAR(50) DEFAULT 'user'
);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- Alter the employees table to add the foreign key constraint
ALTER TABLE employees
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id) REFERENCES employees(id);

-- Insert sample values into employees table
INSERT INTO employees (firstname, lastname, email, phone_no, job_title, department, salary, gender, manager_id) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', 'Software Engineer', 'IT', 60000, 'Male', NULL),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', 'Product Manager', 'Product', 75000, 'Female', 1),
('Alice', 'Johnson', 'alice.johnson@example.com', '3456789012', 'HR Specialist', 'HR', 50000, 'Female', NULL),
('Michael', 'Brown', 'michael.brown@example.com', '4567890123', 'DevOps Engineer', 'IT', 65000, 'Male', 1),
('Emily', 'Davis', 'emily.davis@example.com', '5678901234', 'Marketing Specialist', 'Marketing', 55000, 'Female', NULL),
('Daniel', 'Wilson', 'daniel.wilson@example.com', '6789012345', 'Sales Manager', 'Sales', 70000, 'Male', NULL),
('Sarah', 'Miller', 'sarah.miller@example.com', '7890123456', 'Data Scientist', 'Data', 80000, 'Female', 1),
('James', 'Taylor', 'james.taylor@example.com', '8901234567', 'Business Analyst', 'Business', 62000, 'Male', NULL),
('Laura', 'Anderson', 'laura.anderson@example.com', '9012345678', 'Graphic Designer', 'Design', 48000, 'Female', NULL),
('Robert', 'Thomas', 'robert.thomas@example.com', '1123456789', 'Network Engineer', 'IT', 63000, 'Male', 1),
('Patricia', 'Jackson', 'patricia.jackson@example.com', '2234567890', 'Accountant', 'Finance', 57000, 'Female', NULL),
('Charles', 'White', 'charles.white@example.com', '3345678901', 'Operations Manager', 'Operations', 75000, 'Male', NULL),
('Linda', 'Harris', 'linda.harris@example.com', '4456789012', 'Recruiter', 'HR', 52000, 'Female', 3),
('Christopher', 'Martinez', 'christopher.martinez@example.com', '5567890123', 'QA Engineer', 'QA', 59000, 'Male', 3),
('Barbara', 'Robinson', 'barbara.robinson@example.com', '6678901234', 'Content Writer', 'Content', 51000, 'Female', 3),
('Paul', 'Clark', 'paul.clark@example.com', '7789012345', 'Project Manager', 'Project', 68000, 'Male', 3),
('Jennifer', 'Lewis', 'jennifer.lewis@example.com', '8890123456', 'Legal Advisor', 'Legal', 71000, 'Female', NULL),
('Mark', 'Lee', 'mark.lee@example.com', '9901234567', 'Customer Support', 'Support', 45000, 'Male', NULL),
('Susan', 'Walker', 'susan.walker@example.com', '1012345678', 'Administrative Assistant', 'Admin', 43000, 'Female', NULL),
('Steven', 'Hall', 'steven.hall@example.com', '2123456789', 'Software Architect', 'IT', 90000, 'Male', NULL);
