Project: University Course Management System
You are developing the database for a university that manages students, departments, faculty, courses, enrollments, examinations, libraries, hostels, scholarships, and placements.
Phase 1: Database Creation (DDL)
Task 1
Create a database named UniversityDB.
create database UniversityDB;
Task 2
Create the following tables with appropriate datatypes and constraints.
•	Departments
create table departments(
dept_id int auto_increment primary key,
dept_name varchar(40) unique not null,
dept_code varchar(5) unique not null,
HOD varchar(50) not null,
building_block varchar(50));
desc departments;
•	Faculty
create table faculty(
facault_id int primary key auto_increment,
faculty_name varchar(100) not null,
email varchar(100) unique not null,
dept_id int,
designation varchar(100) not null,
salary decimal(10,2) not null, 
mobile  varchar(10)  unique not null,
foreign key (dept_id) references departments(dept_id));
desc faculty;
•	Students
create table students(
std_id int primary key auto_increment,
std_name varchar(100) not null,
gender varchar(10) check(gender in('male','female','other')),
DOB date not null,
email varchar(100) not null unique,
phone_no varchar(10) unique not null,
dept_id int,
admission_date date not null,
foreign key(dept_id) references departments(dept_id));
desc students;
•	Courses
create table courses(
course_id int primary key auto_increment,
course_name varchar(50) unique not null);
desc courses;
•	CourseCategories
create table course_categories(
cat_id int primary key ,
cat_name varchar(50) not null,
cat_fee decimal(10,2) not null);
desc course_categories;
•	Enrollments
create table enrollments(
enroll_id int primary key auto_increment,
std_id int,
course_id int,
enrollment_date date not null,
sem varchar(50));
desc enrollments;
•	Exams
create table exams(
exam_id int primary key,
course_id int,
exam_name varchar(50) not null,
exam_date date not null,
max_marks int not null);
desc exams;
•	ExamResults
create table exam_results(
result_id int primary key auto_increment,
exam_id int,
std_id int,
exam_name varchar(50),
marks decimal(5,2),
grade char(2));
desc exam_results;
•	Attendance
create table attendance(
att_id int primary key auto_increment,
std_id int,
course_id int,
att_date date not null unique,
att_status varchar(7) not null);
desc attendance;
•	LibraryBooks
create table library_books(
book_id int primary key,
book_name varchar(100)  unique  not null,
copies bigint not null);
desc  library_books;
•	BookIssues
create table book_issues(
issue_id int primary key,
std_id int,
course_id int,
book_id int,
issue_date date not null,
return_date date not null);
desc book_issues;
•	Hostels
create table hostels(
hostel_name varchar(50) primary key,
hostel_address varchar(500) not null,
phone_no bigint unique not null,
varden_name varchar(50) not null);
desc hostels;
•	HostelRooms
create table hostel_room(
room_no int primary key,
capcity int not null,
hostel_name varchar(50));
desc hostel_room;
•	StudentHostels
create table student_hostels(
allocation_id int primary key,
std_id int,
room_no int,
allocation_date date not null);
desc student_hostels;
•	Scholarships
create table scholarships(
scholarship_id int primary key,
scholarship_name varchar(100) not null,
amount decimal(10,2) ,
elibigility varchar(200));
desc scholarships;
•	StudentScholarships
create table StudentScholarships(
id int primary key auto_increment,
std_id int,
dept_id int,
scholarship_id int,
relased_date date not null);
desc StudentScholarships;
•	PlacementCompanies
create table PlacementCompanies(
company_id int primary key,
company_name varchar(100) unique not null,
email varchar(100) not null unique,
address varchar(500) not null,
package decimal(10,2) not null);
desc PlacementCompanies;
•	Placements
create table Placements(
placement_id int primary key,
std_id int,
dept_id int,
company_id int,
Placement_date date,
Placement_status varchar(100) not null);
desc Placements;
Task 3
Apply all applicable constraints wherever necessary.
•	PRIMARY KEY
•	FOREIGN KEY
•	UNIQUE
•	NOT NULL
•	DEFAULT
•	CHECK
•	AUTO_INCREMENT 
create table faculty(
facault_id int primary key auto_increment,
faculty_name varchar(100) not null,
email varchar(100) unique not null,
dept_id int,
designation varchar(100) not null,
salary decimal(10,2) not null, 
mobile  varchar(10)  unique not null,
foreign key (dept_id) references departments(dept_id));
desc faculty;

Task 4
Modify the database structure using ALTER TABLE.
Perform all possible ALTER operations.
•	Add new columns
alter table students add father_name varchar(50) ;
desc students;
•	Drop columns
alter table students drop column father_name;
desc students;
•	Rename columns
alter table students rename column phone_no to mobile;
desc students;
•	Rename tables
rename table students to student_details;
show tables;
•	Modify datatype
alter table exams modify exam_date varchar(10);
desc exams;
•	Change datatype length
alter table exams modify exam_name varchar(100);
desc exams;
•	Add constraints
alter table student_details add  constraint chk_student_status check(student_status in('active','inactive'));
desc student_details;
•	Drop constraints
alter table student_details drop constraint chk_student_status;
desc student_details;
•	Add default values
alter table student_details modify student_status varchar(20) default 'active';
desc student_details;
•	Remove default values
alter table student_details drop student_status;
desc student_details;
Task 5
Use
•	RENAME TABLE
rename table attendance to student_attandence;
show tables;
•	TRUNCATE TABLE
truncate table course_categorirs;
desc course_categorirs;
Task 6
•	Drop one unnecessary table.
drop table StudentScholarships;



