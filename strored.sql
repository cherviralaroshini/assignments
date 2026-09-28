-- Part A: WHERE Clause
-- 1. Display students whose department is Computer Science.
SELECT * FROM students WHERE department_name = 'Computer Science';

-- 2. Display faculty members whose experience is greater than 10 years.
SELECT * FROM faculty WHERE experience_years > 10;

-- 3. Display courses whose course fee is greater than $1,000.
SELECT * FROM courses WHERE course_fee > 1000;

-- 4. Display students whose attendance percentage is less than 75%.
SELECT * FROM students WHERE attendance_percentage < 75;

-- 5. Display placement records where the package is greater than $100,000.
SELECT * FROM placements WHERE package > 100000;

-- Part B: ORDER BY Clause
-- 1. Display all students ordered by student name in ascending order.
SELECT * FROM students ORDER BY student_name ASC;

-- 2. Display faculty members ordered by salary in descending order.
SELECT * FROM faculty ORDER BY salary DESC;

-- 3. Display courses ordered by course fee in ascending order.
SELECT * FROM courses ORDER BY course_fee ASC;

-- 4. Display placement companies ordered by offered package in descending order.
SELECT * FROM placements ORDER BY package DESC;

-- 5. Display library books ordered by publication year in descending order.
SELECT * FROM library_books ORDER BY publication_year DESC;

-- Part C: GROUP BY Clause
-- 1. Display the total number of students in each department.
SELECT department_name, COUNT(student_id) FROM students GROUP BY department_name;

-- 2. Display the total number of faculty members in each department.
SELECT department_name, COUNT(faculty_id) FROM faculty GROUP BY department_name;

-- 3. Display the total number of students enrolled in each course.
SELECT course_id, COUNT(student_id) FROM enrollments GROUP BY course_id;

-- 4. Display the average marks obtained in each course.
SELECT course_id, AVG(marks) FROM examinations GROUP BY course_id;

-- 5. Display the total scholarship amount distributed by each department.
SELECT department_id, SUM(amount) FROM scholarships GROUP BY department_id;

-- Part D: HAVING Clause
-- 1. Display departments having more than 50 students.
SELECT department_name, COUNT(student_id) FROM students GROUP BY department_name HAVING COUNT(student_id) > 50;

-- 2. Display courses with more than 30 enrollments.
SELECT course_id, COUNT(student_id) FROM enrollments GROUP BY course_id HAVING COUNT(student_id) > 30;

-- 3. Display departments whose average marks are greater than 80.
SELECT department_name, AVG(marks) FROM students GROUP BY department_name HAVING AVG(marks) > 80;

-- 4. Display companies that recruited more than 10 students.
SELECT company_name, COUNT(student_id) FROM placements GROUP BY company_name HAVING COUNT(student_id) > 10;

-- 5. Display hostels having more than 100 occupied rooms.
SELECT hostel_name, SUM(occupied_rooms) FROM hostels GROUP BY hostel_name HAVING SUM(occupied_rooms) > 100;

-- Part E: LIMIT Clause
-- 1. Display the first 10 students.
SELECT * FROM students LIMIT 10;

-- 2. Display the top 5 highest-paid faculty members.
SELECT * FROM faculty ORDER BY salary DESC LIMIT 5;

-- 3. Display the top 10 students based on examination marks.
SELECT * FROM students ORDER BY marks DESC LIMIT 10;

-- 4. Display the first 5 placement companies.
SELECT * FROM placements LIMIT 5;

-- 5. Display the top 3 scholarship amounts.
SELECT * FROM scholarships ORDER BY amount DESC LIMIT 3;

-- Part F: OFFSET Clause
-- 1. Display 10 students after skipping the first 5 students.
SELECT * FROM students LIMIT 10 OFFSET 5;

-- 2. Display the next 5 faculty members after the first 10 records.
SELECT * FROM faculty LIMIT 5 OFFSET 10;

-- 3. Display 10 courses after skipping the first 3 courses.
SELECT * FROM courses LIMIT 10 OFFSET 3;

-- 4. Display the next 5 placement companies after the first 5 companies.
SELECT * FROM placements LIMIT 5 OFFSET 5;

-- 5. Display 10 library books after skipping the first 20 books.
SELECT * FROM library_books LIMIT 10 OFFSET 20;

-- Part G: DISTINCT Clause
-- 1. Display unique department names.
SELECT DISTINCT department_name FROM departments;

-- 2. Display unique course categories.
SELECT DISTINCT course_category FROM courses;

-- 3. Display unique placement company locations.
SELECT DISTINCT company_location FROM placements;

-- 4. Display unique scholarship names.
SELECT DISTINCT scholarship_name FROM scholarships;

-- 5. Display unique faculty designations.
SELECT DISTINCT designation FROM faculty;

-- Part H: AS Clause
-- 1. Display student names using appropriate column aliases.
SELECT student_name AS "Student Name" FROM students;

-- 2. Display department names using aliases.
SELECT department_name AS "Department Name" FROM departments;

-- 3. Display course fees using meaningful aliases.
SELECT course_fee AS "Course Fee" FROM courses;

-- 4. Display faculty salaries using aliases.
SELECT salary AS "Monthly Salary" FROM faculty;

-- 5. Display placement packages using appropriate aliases.
SELECT package AS "Offered Package" FROM placements;

-- Part I: Combination of Multiple Clauses
-- 1. Display the total number of students in each department where the department has more than 30 students, ordered by student count in descending order.
SELECT department_name, COUNT(student_id) AS total_students FROM students GROUP BY department_name HAVING COUNT(student_id) > 30 ORDER BY total_students DESC;

-- 2. Display the average marks of each course where the average marks are greater than 75, ordered from highest to lowest.
SELECT course_name, AVG(marks) AS average_marks FROM examinations GROUP BY course_name HAVING AVG(marks) > 75 ORDER BY average_marks DESC;

-- 3. Display the top 5 departments having the highest average attendance percentage.
SELECT department_name, AVG(attendance_percentage) AS average_attendance FROM students GROUP BY department_name ORDER BY average_attendance DESC LIMIT 5;

-- 4. Display unique company names that offered placement packages greater than $100,000, ordered alphabetically.
SELECT DISTINCT company_name FROM placements WHERE package > 100000 ORDER BY company_name ASC;

-- 5. Display the total scholarship amount distributed by each department where the total amount exceeds $50,000.
SELECT department_name, SUM(amount) AS total_scholarship_amount FROM scholarships GROUP BY department_name HAVING SUM(amount) > 50000;

-- 6. Display the total number of books issued by each department where the issue count is greater than 20, ordered by issue count in descending order.
SELECT department_name, COUNT(issue_id) AS issue_count FROM book_issues GROUP BY department_name HAVING COUNT(issue_id) > 20 ORDER BY issue_count DESC;

-- 7. Display the top 10 students with the highest marks from the Computer Science department using WHERE, ORDER BY, and LIMIT.
SELECT student_name, marks FROM students WHERE department_name = 'Computer Science' ORDER BY marks DESC LIMIT 10;

-- 8. Display departments with more than five faculty members, ordered by faculty count in descending order.
SELECT department_name, COUNT(faculty_id) AS faculty_count FROM faculty GROUP BY department_name HAVING COUNT(faculty_id) > 5 ORDER BY faculty_count DESC;

-- 9. Display the average placement package offered by each company where the average package exceeds $80,000, ordered by package amount in descending order.
SELECT company_name, AVG(package) AS average_package FROM placements GROUP BY company_name HAVING AVG(package) > 80000 ORDER BY average_package DESC;

-- 10. Display unique course names along with the total number of enrolled students, ordered by enrollment count in descending order using DISTINCT, GROUP BY, HAVING, ORDER BY, and AS.
SELECT DISTINCT course_name AS Course_Name, COUNT(student_id) AS Total_Students FROM enrollments GROUP BY course_name HAVING COUNT(student_id) > 0 ORDER BY Total_Students DESC;
