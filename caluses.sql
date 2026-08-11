Phase 5: SQL Clauses Assignment – University Management System
Objective
Write SQL queries using every SQL clause based on the University Management System database.
Rules
Write only SQL queries.
Use only the existing university database tables.
Do not modify the database structure.
Create complex queries by combining multiple clauses wherever applicable.
Write a minimum of 5 queries for each clause.
Part A: WHERE Clause
Display students whose department is Computer Science.
   SELECT *
FROM Student_details
WHERE dept_id = (
    SELECT dept_id
    FROM Departments
    WHERE dept_name = 'Computer Science');
Display faculty members whose experience is greater than 10 years.
  select *from faculty where excpriance >10;
Display courses whose course fee is greater than $1,000.
  select*from courses where course_fee >$1,000;
Display students whose attendance percentage is less than 75%.
  select*from student_attandence where percentage<75%;
Display placement records where the package is greater than $100,000.
  select *from placements where packages <$100,000;
Part B: ORDER BY Clause
Display all students ordered by student name in ascending order.
  select* from  student_details order by std_name asc;
Display faculty members ordered by salary in descending order.
  select*from faculty order by salary desc;
Display courses ordered by course fee in ascending order.
  select*from courses order by course_fee asc;
Display placement companies ordered by offered package in descending order.
  select *from placements order by packages desc;
Display library books ordered by publication year in descending order.
  select*from library_books order by publication_year desc; 
Part C: GROUP BY Clause
Display the total number of students in each department.
  select  d.dept_name,count(s.std_id) as total_students
from departments d join student_details s on d.dept_id=s.dept_id group by d.dept_id,d.dept_name;
Display the total number of faculty members in each department.
  select d.dept_name,count(f.facault_id)as total_faculty
from departments d join faculty f on d.dept_id=f.dept_id
group by d.dept_id,d.dept_name;
Display the total number of students enrolled in each course.
  SELECT c.course_name, COUNT(e.enrollment_id) AS total_enrollments
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
Display the average marks obtained in each course.
  SELECT c.course_name, AVG(er.marks) AS average_marks
FROM Courses c
JOIN Exams ex ON c.course_id = ex.course_id
JOIN ExamResults er ON ex.exam_id = er.exam_id
GROUP BY c.course_id, c.course_name; 
Display the total scholarship amount distributed by each department.
  SELECT d.department_name,
       SUM(ss.scholarship_amount) AS total_scholarship_amount
FROM Departments d
JOIN Students s ON d.department_id = s.department_id
JOIN StudentScholarships ss ON s.student_id = ss.student_id
GROUP BY d.department_id, d.department_name;
Part D: HAVING Clause
Display departments having more than 50 students.
Display courses with more than 30 enrollments.
Display departments whose average marks are greater than 80.
Display companies that recruited more than 10 students.
Display hostels having more than 100 occupied rooms.
Part E: LIMIT Clause
Display the first 10 students.
Display the top 5 highest-paid faculty members.
Display the top 10 students based on examination marks.
Display the first 5 placement companies.
Display the top 3 scholarship amounts.
Part F: OFFSET Clause
Display 10 students after skipping the first 5 students.
Display the next 5 faculty members after the first 10 records.
Display 10 courses after skipping the first 3 courses.
Display the next 5 placement companies after the first 5 companies.
Display 10 library books after skipping the first 20 books.
Part G: DISTINCT Clause
Display unique department names.
Display unique course categories.
Display unique placement company locations.
Display unique scholarship names.
Display unique faculty designations.
Part H: AS Clause
Display student names using appropriate column aliases.
Display department names using aliases.
Display course fees using meaningful aliases.
Display faculty salaries using aliases.
Display placement packages using appropriate aliases.
Part I: Combination of Multiple Clauses
Display the total number of students in each department where the department has more than 30 students, ordered by student count in descending order.
Display the average marks of each course where the average marks are greater than 75, ordered from highest to lowest.
Display the top 5 departments having the highest average attendance percentage.
Display unique company names that offered placement packages greater than $100,000, ordered alphabetically.
Display the total scholarship amount distributed by each department where the total amount exceeds $50,000.
Display the total number of books issued by each department where the issue count is greater than 20, ordered by issue count in descending order.
Display the top 10 students with the highest marks from the Computer Science department using WHERE, ORDER BY, and LIMIT.
Display departments with more than five faculty members, ordered by faculty count in descending order.
Display the average placement package offered by each company where the average package exceeds $80,000, ordered by package amount in descending order.
Display unique course names along with the total number of enrolled students, ordered by enrollment count in descending order using DISTINCT, GROUP BY, HAVING, ORDER BY, and AS.

