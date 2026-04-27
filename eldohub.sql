CREATE DATABASE EldoHub;
USE EldoHub;
-- ======================
-- 1. STUDENTS TABLE
-- ======================
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15)
);

-- ======================
-- 2. COURSES TABLE
-- ======================
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT NOT NULL,
    lecturer VARCHAR(100) NOT NULL,
    duration_in_months INT NOT NULL
);

-- ======================
-- 3. ENROLLMENTS TABLE
-- ======================
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- ======================
-- 4. RESOURCES TABLE
-- ======================
CREATE TABLE Resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    resource_name VARCHAR(150) NOT NULL,
    resource_type VARCHAR(50) NOT NULL,
    resource_url TEXT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- ======================
-- INSERT STUDENTS (10)
-- ======================
INSERT INTO Students (fullname, email, password, phone_number) VALUES
('John Kamau', 'john.kamau@gmail.com', 'hashed_pw1', '0712345678'),
('Mary Wanjiku', 'mary.wanjiku@yahoo.com', 'hashed_pw2', '0723456789'),
('Peter Otieno', 'peter.otieno@gmail.com', 'hashed_pw3', '0734567890'),
('Grace Njeri', 'grace.njeri@hotmail.com', 'hashed_pw4', '0745678901'),
('David Mwangi', 'david.mwangi@gmail.com', 'hashed_pw5', '0756789012'),
('Lucy Atieno', 'lucy.atieno@yahoo.com', 'hashed_pw6', '0767890123'),
('Brian Kiptoo', 'brian.kiptoo@gmail.com', 'hashed_pw7', '0778901234'),
('Faith Achieng', 'faith.achieng@gmail.com', 'hashed_pw8', '0789012345'),
('Kevin Mutua', 'kevin.mutua@yahoo.com', 'hashed_pw9', '0790123456'),
('Ann Wambui', 'ann.wambui@gmail.com', 'hashed_pw10', '0701234567');

-- ======================
-- INSERT COURSES (10)
-- ======================
INSERT INTO Courses (course_name, course_description, lecturer, duration_in_months) VALUES
('Introduction to Programming', 'Learn programming using Python.', 'Dr. Smith', 3),
('Data Structures', 'Learn stacks, queues, trees, and graphs.', 'Dr. Johnson', 4),
('Web Development', 'HTML, CSS, JavaScript fundamentals.', 'Dr. Lee', 4),
('Database Systems', 'SQL and database design.', 'Dr. Brown', 3),
('Machine Learning', 'Intro to ML algorithms.', 'Dr. Davis', 5),
('Mobile App Development', 'Android and iOS basics.', 'Dr. Kim', 4),
('Cyber Security', 'Fundamentals of security and encryption.', 'Dr. White', 3),
('Cloud Computing', 'AWS and cloud infrastructure.', 'Dr. Green', 4),
('Artificial Intelligence', 'AI concepts and applications.', 'Dr. Black', 5),
('Software Engineering', 'SDLC and best practices.', 'Dr. Adams', 4);

-- ======================
-- INSERT ENROLLMENTS (10)
-- ======================
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-11'),
(3, 3, '2024-01-12'),
(4, 4, '2024-01-13'),
(5, 5, '2024-01-14'),
(6, 6, '2024-01-15'),
(7, 7, '2024-01-16'),
(8, 8, '2024-01-17'),
(9, 9, '2024-01-18'),
(10, 10, '2024-01-19');

-- ======================
-- INSERT RESOURCES (10)
-- ======================
INSERT INTO Resources (course_id, resource_name, resource_type, resource_url) VALUES
(1, 'Python Basics Video', 'Video', 'https://example.com/python'),
(2, 'Data Structures Notes', 'PDF', 'https://example.com/ds'),
(3, 'HTML Guide', 'PDF', 'https://example.com/html'),
(4, 'SQL Tutorial', 'Video', 'https://example.com/sql'),
(5, 'ML Intro Slides', 'Slides', 'https://example.com/ml'),
(6, 'Android Dev Guide', 'PDF', 'https://example.com/android'),
(7, 'Cyber Security Basics', 'Video', 'https://example.com/security'),
(8, 'AWS Cloud Intro', 'Video', 'https://example.com/aws'),
(9, 'AI Overview', 'PDF', 'https://example.com/ai'),
(10, 'Software Engineering Book', 'PDF', 'https://example.com/se');

-- ======================
-- SELECT QUERIES
-- ======================
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Resources;

-- Students + Courses (JOIN)
SELECT s.fullname, c.course_name, e.enrollment_date
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Courses + Resources
SELECT c.course_name, r.resource_name, r.resource_type, r.resource_url
FROM Resources r
JOIN Courses c ON r.course_id = c.course_id;

-- ======================
-- UPDATE EXAMPLE
-- ======================
UPDATE Students
SET phone_number = '0711111111'
WHERE student_id = 1;

-- ======================
-- DELETE EXAMPLE
-- ======================
DELETE FROM Enrollments
WHERE enrollment_id = 2;

http://localhost:3000/students