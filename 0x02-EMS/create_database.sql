-- Create a new database
CREATE DATABASE IF NOT EXISTS EMS;

-- Use the created database
USE EMS;

-- Create all tables
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_no BIGINT NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hiring_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salary INT NOT NULL,
    rating FLOAT DEFAULT 0.0,
    gender VARCHAR(50) NOT NULL,
    manager_id INT,
);
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY,
    email VARCHAR(250),
    password VARCHAR(250),
    passwordConfirm VARCHAR(250),
    role VARCHAR(250)
);

-- DELIMITER //
-- CREATE TRIGGER password_check
-- BEFORE INSERT ON users
-- FOR EACH ROW
-- BEGIN
--     IF NEW.password != NEW.passwordConfirm THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Passwords do not match';
--     END IF;
-- END;//
-- DELIMITER ;

-- DELIMITER //
-- CREATE TRIGGER password_check_update
-- BEFORE UPDATE ON users
-- FOR EACH ROW
-- BEGIN
--     IF NEW.password != NEW.passwordConfirm THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Passwords do not match';
--     END IF;
-- END;//
-- DELIMITER ;

-- CREATE TABLE IF NOT EXISTS ratings (
--     employ_id INT PRIMARY KEY,
--     attendance_rate FLOAT,
--     task_timing FLOAT,
--     task_quality FLOAT
-- );


-- CREATE TABLE IF NOT EXISTS attendance (
--     employ_id INT PRIMARY KEY,
--     arrive_time TIMESTAMP,
--     leave_time TIMESTAMP,
--     working_hours FLOAT,
--     permission INT DEFAULT 2
-- );

-- -- Drop existing triggers
-- DROP TRIGGER IF EXISTS before_attendance_insert;
-- DROP TRIGGER IF EXISTS before_attendance_update;

-- -- Trigger before insert
-- DELIMITER //
-- CREATE TRIGGER before_attendance_insert
-- BEFORE INSERT ON attendance
-- FOR EACH ROW
-- BEGIN
--     SET NEW.working_hours = TIMESTAMPDIFF(HOUR, NEW.arrive_time, NEW.leave_time);
-- END;
-- //

-- -- Trigger before update
-- CREATE TRIGGER before_attendance_update
-- BEFORE UPDATE ON attendance
-- FOR EACH ROW
-- BEGIN
--     SET NEW.working_hours = TIMESTAMPDIFF(HOUR, NEW.arrive_time, NEW.leave_time);
-- END;
-- //
-- DELIMITER ;

-- Insert sample values into employees table
INSERT INTO employees (firstname, lastname, email, phone_no, job_title, department, salary, gender, manager_id) VALUES
('John', 'Doe', 'john.doe@example.com', 1234567890, 'Software Engineer', 'IT', 60000, 'Male', NULL),
('Jane', 'Smith', 'jane.smith@example.com', 2345678901, 'Product Manager', 'Product', 75000, 'Female', 1),
('Alice', 'Johnson', 'alice.johnson@example.com', 3456789012, 'HR Specialist', 'HR', 50000, 'Female', NULL),
('Michael', 'Brown', 'michael.brown@example.com', 4567890123, 'DevOps Engineer', 'IT', 65000, 'Male', 1),
('Emily', 'Davis', 'emily.davis@example.com', 5678901234, 'Marketing Specialist', 'Marketing', 55000, 'Female', 6),
('Daniel', 'Wilson', 'daniel.wilson@example.com', 6789012345, 'Sales Manager', 'Sales', 70000, 'Male', NULL),
('Sarah', 'Miller', 'sarah.miller@example.com', 7890123456, 'Data Scientist', 'Data', 80000, 'Female', 1),
('James', 'Taylor', 'james.taylor@example.com', 8901234567, 'Business Analyst', 'Business', 62000, 'Male', 6),
('Laura', 'Anderson', 'laura.anderson@example.com', 9012345678, 'Graphic Designer', 'Design', 48000, 'Female', 6),
('Robert', 'Thomas', 'robert.thomas@example.com', 1123456789, 'Network Engineer', 'IT', 63000, 'Male', 1),
('Patricia', 'Jackson', 'patricia.jackson@example.com', 2234567890, 'Accountant', 'Finance', 57000, 'Female', 6),
('Charles', 'White', 'charles.white@example.com', 3345678901, 'Operations Manager', 'Operations', 75000, 'Male', NULL),
('Linda', 'Harris', 'linda.harris@example.com', 4456789012, 'Recruiter', 'HR', 52000, 'Female', 12),
('Christopher', 'Martinez', 'christopher.martinez@example.com', 5567890123, 'QA Engineer', 'QA', 59000, 'Male', 12),
('Barbara', 'Robinson', 'barbara.robinson@example.com', 6678901234, 'Content Writer', 'Content', 51000, 'Female', 12),
('Paul', 'Clark', 'paul.clark@example.com', 7789012345, 'Project Manager', 'Project', 68000, 'Male', 12),
('Jennifer', 'Lewis', 'jennifer.lewis@example.com', 8890123456, 'Legal Advisor', 'Legal', 71000, 'Female', 3),
('Mark', 'Lee', 'mark.lee@example.com', 9901234567, 'Customer Support', 'Support', 45000, 'Male', 3),
('Susan', 'Walker', 'susan.walker@example.com', 1012345678, 'Administrative Assistant', 'Admin', 43000, 'Female', 3),
('Steven', 'Hall', 'steven.hall@example.com', 2123456789, 'Software Architect', 'IT', 90000, 'Male', 3);

-- -- Insert sample values into ratings table
-- INSERT INTO users (user_id, email, password, passwordConfirm)
-- VALUES
--     (1, 'john.doe@example.com', 'password123', 'password123'),
--     (2, 'jane.doe@example.com', 'password456', 'password456'),
--     (3, 'bob.smith@example.com', 'password789', 'password789'),
--     (4, 'alice.johnson@example.com', 'password012', 'password012'),
--     (5, 'mike.williams@example.com', 'password345', 'password345');

-- -- Insert sample values into ratings table
-- INSERT INTO ratings (employ_id, attendance_rate, task_timing, task_quality) VALUES
-- (1, 95.5, 88.0, 92.3),
-- (2, 90.0, 85.5, 89.0),
-- (3, 98.0, 90.5, 95.0),
-- (4, 92.5, 87.0, 91.3),
-- (5, 89.0, 84.5, 88.0),
-- (6, 94.0, 89.5, 92.0),
-- (7, 97.5, 91.0, 95.3),
-- (8, 88.0, 83.5, 87.0),
-- (9, 91.0, 86.5, 90.0),
-- (10, 93.5, 88.5, 92.5),
-- (11, 89.5, 84.0, 88.3),
-- (12, 96.0, 90.5, 94.0),
-- (13, 90.5, 85.0, 89.3),
-- (14, 95.0, 89.0, 93.0),
-- (15, 92.0, 87.5, 91.0),
-- (16, 89.0, 84.5, 88.0),
-- (17, 94.5, 90.0, 93.3),
-- (18, 87.5, 82.0, 86.3),
-- (19, 91.5, 86.0, 90.3),
-- (20, 96.5, 91.5, 95.5);

-- -- Insert sample values into attendance table
-- INSERT INTO attendance (employ_id, arrive_time, leave_time, working_hours, permission) VALUES
-- (1, '2024-07-01 08:00:00', '2024-07-01 16:00:00', NULL, 1),
-- (2, '2024-07-01 09:00:00', '2024-07-01 17:00:00', NULL, 2),
-- (3, '2024-07-01 08:30:00', '2024-07-01 16:30:00', NULL, 0),
-- (4, '2024-07-01 08:15:00', '2024-07-01 16:15:00', NULL, 1),
-- (5, '2024-07-01 08:45:00', '2024-07-01 16:45:00', NULL, 2),
-- (6, '2024-07-01 09:00:00', '2024-07-01 17:00:00', NULL, 1),
-- (7, '2024-07-01 08:00:00', '2024-07-01 16:00:00', NULL, 0),
-- (8, '2024-07-01 08:30:00', '2024-07-01 16:30:00', NULL, 2),
-- (9, '2024-07-01 08:15:00', '2024-07-01 16:15:00', NULL, 1),
-- (10, '2024-07-01 08:45:00', '2024-07-01 16:45:00', NULL, 0),
-- (11, '2024-07-01 09:00:00', '2024-07-01 17:00:00', NULL, 2),
-- (12, '2024-07-01 08:00:00', '2024-07-01 16:00:00', NULL, 1),
-- (13, '2024-07-01 08:30:00', '2024-07-01 16:30:00', NULL, 0),
-- (14, '2024-07-01 08:15:00', '2024-07-01 16:15:00', NULL, 1),
-- (15, '2024-07-01 08:45:00', '2024-07-01 16:45:00', NULL, 2),
-- (16, '2024-07-01 09:00:00', '2024-07-01 17:00:00', NULL, 0),
-- (17, '2024-07-01 08:00:00', '2024-07-01 16:00:00', NULL, 1),
-- (18, '2024-07-01 08:30:00', '2024-07-01 16:30:00', NULL, 2),
-- (19, '2024-07-01 08:15:00', '2024-07-01 16:15:00', NULL, 0),
-- (20, '2024-07-01 08:45:00', '2024-07-01 16:45:00', NULL, 1);
