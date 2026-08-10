-- PHASE 3: DATA RETRIEVAL (DQL)
-- UNIVERSITY MANAGEMENT SYSTEM
-- Only SELECT statements

-- =========================================================
-- RETRIEVE ALL COLUMNS
-- =========================================================

-- Task 1
SELECT *
FROM Students;

-- Task 2
SELECT *
FROM Departments;

-- Task 3
SELECT *
FROM Faculty;

-- Task 4
SELECT *
FROM Courses;


-- =========================================================
-- RETRIEVE SELECTED COLUMNS
-- =========================================================

-- Task 5
SELECT student_id, student_name, email
FROM Students;

-- Task 6
SELECT department_name, location
FROM Departments;

-- Task 7
SELECT course_name, credits, course_fee
FROM Courses;

-- Task 8
SELECT faculty_name, designation, salary
FROM Faculty;


-- =========================================================
-- ALIASES
-- =========================================================

-- Task 9
SELECT
    s.student_name AS "Student Name",
    d.department_name AS "Department Name"
FROM Students s
JOIN Departments d
    ON s.department_id = d.department_id;

-- Task 10
SELECT
    company_name AS "Company Name",
    package AS "Offered Package"
FROM PlacementCompanies;

-- Task 11
SELECT
    course_name AS "Course Name",
    course_fee AS "Course Fee"
FROM Courses;

-- Task 12
SELECT
    faculty_name AS "Faculty Name",
    experience AS "Years of Experience"
FROM Faculty;


-- =========================================================
-- DISTINCT
-- =========================================================

-- Task 13
SELECT DISTINCT department_name
FROM Departments;

-- Task 14
SELECT DISTINCT category_name
FROM CourseCategories;

-- Task 15
SELECT DISTINCT scholarship_name
FROM Scholarships;

-- Task 16
SELECT DISTINCT company_name
FROM PlacementCompanies;


-- =========================================================
-- EXPRESSIONS
-- =========================================================

-- Task 17
SELECT
    s.student_name AS "Student Name",
    a.attendance_percentage AS "Attendance Percentage",
    SUM(er.marks_obtained) AS "Exam Marks"
FROM Students s
JOIN Attendance a
    ON s.student_id = a.student_id
JOIN ExamResults er
    ON s.student_id = er.student_id
GROUP BY
    s.student_id,
    s.student_name,
    a.attendance_percentage;

-- Task 18
SELECT
    faculty_name AS "Faculty Name",
    salary AS "Monthly Salary",
    salary * 12 AS "Annual Salary"
FROM Faculty;

-- Task 19
SELECT
    course_name AS "Course Name",
    course_fee,
    registration_fee,
    course_fee + registration_fee AS "Total Fee"
FROM Courses;

-- Task 20
SELECT
    s.student_id,
    s.student_name,
    SUM(er.marks_obtained) AS "Total Marks"
FROM Students s
JOIN ExamResults er
    ON s.student_id = er.student_id
GROUP BY
    s.student_id,
    s.student_name;


-- =========================================================
-- ARITHMETIC CALCULATIONS
-- =========================================================

-- Task 21
SELECT
    s.student_name AS "Student Name",
    sc.scholarship_amount AS "Scholarship Amount",
    sc.scholarship_amount + 5000 AS "Amount After Bonus"
FROM StudentScholarships ss
JOIN Students s
    ON ss.student_id = s.student_id
JOIN Scholarships sc
    ON ss.scholarship_id = sc.scholarship_id;

-- Task 22
SELECT
    faculty_name AS "Faculty Name",
    salary AS "Current Salary",
    salary * 1.10 AS "Salary After 10% Increment"
FROM Faculty;

-- Task 23
SELECT
    company_name AS "Company Name",
    package AS "Placement Package",
    package - joining_fee AS "Package After Joining Fee"
FROM PlacementCompanies;

-- Task 24
SELECT
    room_number AS "Room Number",
    room_charges AS "Room Charges",
    room_charges * 1.18 AS "Charges Including GST"
FROM HostelRooms;


-- =========================================================
-- STRING CONCATENATION
-- =========================================================

-- Task 25
SELECT
    CONCAT(first_name, ' ', last_name) AS "Full Name"
FROM Students;

-- Task 26
SELECT
    CONCAT(faculty_name, ' - ', designation) AS "Faculty Information"
FROM Faculty;

-- Task 27
SELECT
    CONCAT(h.hostel_name, ' - Room ', hr.room_number)
        AS "Hostel Room Information"
FROM HostelRooms hr
JOIN Hostels h
    ON hr.hostel_id = h.hostel_id;

-- Task 28
SELECT
    CONCAT(company_name, ' - ', job_role)
        AS "Placement Information"
FROM PlacementCompanies;


-- =========================================================
-- NULL HANDLING
-- =========================================================

-- Task 29
SELECT
    student_id,
    student_name,
    COALESCE(mobile_number, 'Not Available') AS "Mobile Number"
FROM Students;

-- Task 30
SELECT
    faculty_id,
    faculty_name,
    COALESCE(email, 'Email Not Provided') AS "Email Address"
FROM Faculty;
