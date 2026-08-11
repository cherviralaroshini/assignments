`Phase 3: Data Retrieval (DQL) Assignment
University Management System
Objective
Write SQL SELECT queries to retrieve information from the University Management System database.
Rules
Write only SQL queries.
Do not modify any data.
Use only SELECT statements.
Use the existing university database tables.
Complete all 30 tasks.
Retrieve All Columns
Task 1
Display all information of all students.
  select*from student_details;
Task 2
Display all information of all departments.
  select*from departments;
Task 3
Display all information of all faculty members.
  select *from faculty;
Task 4
Display all information of all courses.
select*from courses;
Retrieve Selected Columns
Task 5
Display the student ID, student name, and email of all students.
  select std_id,std_name,email from student_details;
Task 6
Display the department name and department location.
  select dept_name,building_block from departments;cred
Task 7
Display the course name, credits, and course fee.
  select cat_name, credits,cat_fee from course_categories;
Task 8
Display the faculty name, designation, and salary.
  select faculty_name,designation,salary from faculty;
Aliases
Task 9
Display student names and department names using meaningful column aliases.
  SELECT
    s.std_name AS "Student Name",
    d.dept_name AS "Department Name"
FROM student_details s
JOIN Departments d
    ON s.dept_id = d.dept_id;
Task 10
Display company names and offered packages using custom aliases.
  SELECT
    company_name AS "Company Name",
    package AS "Offered Package"
FROM PlacementCompanies;
Task 11
Display course names and course fees using aliases.
  cat_name as "course name",
 cat_fee as "course fee" from course_categories;
Task 12
Display faculty names and experience using aliases.
  faculty_name as "faculty name",
exprience  as "years of exprience"
from faculty;

DISTINCT
Task 13
Display all unique department names.
   select distinct dept_name from departments;
Task 14
Display all unique course categories.
      select distinct course_name from courses;
Task 15
Display all unique scholarship names awarded to students.
  select distinct scholarship_name from scholarships;
Task 16
Display all unique placement company names.
      select distinct company_names from placements;
Expressions
Task 17
Display each student's name along with their attendance percentage and exam marks in a single result.
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

Task 18
Display each faculty member's salary along with their annual salary.
      select faculty_name,salary,salary*12 as "annual salary" from faculty;
Task 19
Display each course along with its total fee after adding the registration fee.
  SELECT
    course_name AS "Course Name",
    course_fee,
    registration_fee,
    course_fee + registration_fee AS "Total Fee"
FROM Courses;
Task 20
Display every student's total marks obtained across all examinations.
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

Arithmetic Calculations
Task 21
Display each student's scholarship amount after adding a fixed bonus amount.
  SELECT
    s.student_name AS "Student Name",
    sc.scholarship_amount AS "Scholarship Amount",
    sc.scholarship_amount + 5000 AS "Amount After Bonus"
FROM StudentScholarships ss
JOIN Students s
    ON ss.student_id = s.student_id
JOIN Scholarships sc
    ON ss.scholarship_id = sc.scholarship_id;
Task 22
Display faculty salaries after applying a 10% salary increment.
  SELECT
    faculty_name AS "Faculty Name",
    salary AS "Current Salary",
    salary * 1.10 AS "Salary After 10% Increment"
FROM Faculty;
Task 23
Display placement packages after deducting a fixed joining fee.
  SELECT
    company_name AS "Company Name",
    package AS "Placement Package",
    package - joining_fee AS "Package After Joining Fee"
FROM PlacementCompanies;
Task 24
Display hostel room charges after adding GST.
  SELECT
    room_number AS "Room Number",
    room_charges AS "Room Charges",
    room_charges * 1.18 AS "Charges Including GST"
FROM HostelRooms;
  
String Concatenation
Task 25
Display each student's full name by combining first name and last name.
  SELECT
    CONCAT(first_name, ' ', last_name) AS "Full Name"
FROM Students;
Task 26
Display faculty information by combining faculty name and designation into a single column.
  SELECT
    CONCAT(faculty_name, ' - ', designation) AS "Faculty Information"
FROM Faculty;

Task 27
Display complete hostel room information by combining hostel name and room number.
  SELECT
    CONCAT(h.hostel_name, ' - Room ', hr.room_number)
        AS "Hostel Room Information"
FROM HostelRooms hr
JOIN Hostels h
    ON hr.hostel_id = h.hostel_id;
Task 28
Display placement information by combining company name and job role.
  
SELECT
    CONCAT(company_name, ' - ', job_role)
        AS "Placement Information"
FROM PlacementCompanies;
NULL Handling
Task 29
Display students whose mobile number is not available by replacing NULL with 'Not Available'.
  SELECT
    student_id,
    student_name,
    COALESCE(mobile_number, 'Not Available') AS "Mobile Number"
FROM Students;
Task 30
Display faculty members whose email address is missing by replacing NULL with 'Email Not Provided'.
SELECT
    faculty_id,
    faculty_name,
    COALESCE(email, 'Email Not Provided') AS "Email Address"
FROM Faculty;
