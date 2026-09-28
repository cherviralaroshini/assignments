-- Part A: Arithmetic Operators

-- Addition (+)
-- Display each student's exam marks after adding 5 bonus marks.
SELECT Student_ID, Marks + 5 AS Marks_With_Bonus FROM Students;

-- Display each faculty member's salary after adding a monthly allowance.
SELECT Employee_ID, Salary + Monthly_Allowance AS Total_Salary FROM Faculty;

-- Display each scholarship amount after adding a fixed incentive amount.
SELECT Scholarship_ID, Amount + Incentive_Amount AS Total_Amount FROM Scholarships;

-- Subtraction (-)
-- Display placement packages after deducting a joining fee.
SELECT Placement_ID, Package - Joining_Fee AS Net_Package FROM Placements;

-- Display hostel room charges after deducting a student discount.
SELECT Room_ID, Room_Charge - Student_Discount AS Discounted_Charge FROM Hostel_Rooms;

-- Display faculty salaries after deducting professional tax.
SELECT Employee_ID, Salary - Professional_Tax AS Net_Salary FROM Faculty;

-- Multiplication (*)
-- Display each faculty member's annual salary.
SELECT Employee_ID, Monthly_Salary * 12 AS Annual_Salary FROM Faculty;

-- Display the total fee for each course based on fee × number of enrolled students.
SELECT Course_ID, Fee * Enrolled_Students AS Total_Fee FROM Courses;

-- Display the total scholarship amount by multiplying the monthly scholarship amount by 12.
SELECT Scholarship_ID, Monthly_Scholarship_Amount * 12 AS Annual_Scholarship_Amount FROM Scholarships;

-- Division (/)
-- Display each student's average marks by dividing total marks by the number of examinations.
SELECT Student_ID, Total_Marks / Number_Of_Examinations AS Average_Marks FROM Students;

-- Display the monthly hostel fee from the annual hostel fee.
SELECT Hostel_ID, Annual_Hostel_Fee / 12 AS Monthly_Hostel_Fee FROM Hostels;

-- Display the monthly salary of each faculty member.
SELECT Employee_ID, Annual_Salary / 12 AS Monthly_Salary FROM Faculty;

-- Modulus (%)
-- Display students whose Student ID is an even number.
SELECT * FROM Students WHERE Student_ID % 2 = 0;

-- Display hostel rooms having odd room numbers.
SELECT * FROM Hostel_Rooms WHERE Room_Number % 2 <> 0;

-- Display faculty members whose Employee ID is divisible by 5.
SELECT * FROM Faculty WHERE Employee_ID % 5 = 0;


-- Part B: Comparison Operators

-- Equal To (=)
-- Display students belonging to the Computer Science department.
SELECT * FROM Students WHERE Department = 'Computer Science';

-- Display faculty members whose designation is Professor.
SELECT * FROM Faculty WHERE Designation = 'Professor';

-- Display courses having exactly 4 credits.
SELECT * FROM Courses WHERE Credits = 4;

-- Not Equal To (<>)
-- Display students who do not belong to the Mechanical department.
SELECT * FROM Students WHERE Department <> 'Mechanical';

-- Display faculty members whose designation is not Assistant Professor.
SELECT * FROM Faculty WHERE Designation <> 'Assistant Professor';

-- Display books that are not available.
SELECT * FROM Books WHERE Availability_Status <> 'Available';

-- Not Equal To (!=)
-- Display students whose scholarship status is not Approved.
SELECT * FROM Scholarships WHERE Status != 'Approved';

-- Display companies whose industry is not Software.
SELECT * FROM Companies WHERE Industry != 'Software';

-- Display hostels whose type is not Boys Hostel.
SELECT * FROM Hostels WHERE Type != 'Boys Hostel';

-- Greater Than (>)
-- Display students who scored more than 85 marks.
SELECT * FROM Students WHERE Marks > 85;

-- Display faculty members earning more than $80,000 annually.
SELECT * FROM Faculty WHERE Annual_Salary > 80000;

-- Display placement packages greater than $100,000.
SELECT * FROM Placements WHERE Package > 100000;

-- Less Than (<)
-- Display students whose attendance is below 75%.
SELECT * FROM Students WHERE Attendance_Percentage < 75;

-- Display hostel rooms with capacity less than 3.
SELECT * FROM Hostel_Rooms WHERE Capacity < 3;

-- Display books having fewer than 5 available copies.
SELECT * FROM Books WHERE Available_Copies < 5;

-- Greater Than or Equal To (>=)
-- Display students scoring at least 90 marks.
SELECT * FROM Students WHERE Marks >= 90;

-- Display faculty members with at least 10 years of experience.
SELECT * FROM Faculty WHERE Experience_Years >= 10;

-- Display scholarship amounts greater than or equal to $5,000.
SELECT * FROM Scholarships WHERE Amount >= 5000;

-- Less Than or Equal To (<=)
-- Display students whose attendance is less than or equal to 60%.
SELECT * FROM Students WHERE Attendance_Percentage <= 60;

-- Display courses having fees less than or equal to $1,000.
SELECT * FROM Courses WHERE Fee <= 1000;

-- Display companies offering packages less than or equal to $80,000.
SELECT * FROM Placements WHERE Package <= 80000;


-- Part C: Logical Operators

-- AND
-- Display students who scored above 85 marks and have attendance above 90%.
SELECT * FROM Students WHERE Marks > 85 AND Attendance_Percentage > 90;

-- Display faculty members from the Computer Science department and having more than 10 years of experience.
SELECT * FROM Faculty WHERE Department = 'Computer Science' AND Experience_Years > 10;

-- Display placement records where the package is above $100,000 and the company belongs to the Software industry.
SELECT * FROM Placements WHERE Package > 100000 AND Company_Industry = 'Software';

-- OR
-- Display students belonging to either Computer Science or Artificial Intelligence.
SELECT * FROM Students WHERE Department = 'Computer Science' OR Department = 'Artificial Intelligence';

-- Display faculty members whose designation is Professor or Associate Professor.
SELECT * FROM Faculty WHERE Designation = 'Professor' OR Designation = 'Associate Professor';

-- Display books that are either overdue or lost.
SELECT * FROM Books WHERE Status = 'Overdue' OR Status = 'Lost';

-- NOT
-- Display students who are not placed.
SELECT * FROM Students WHERE NOT Placement_Status = 'Placed';

-- Display faculty members who are not assigned to any course.
SELECT * FROM Faculty WHERE NOT Course_Assignment_Status = 'Assigned';

-- Display books that are not currently issued.
SELECT * FROM Books WHERE NOT Status = 'Issued';


-- Part D: Range Operator

-- BETWEEN
-- Display students whose marks are between 70 and 90.
SELECT * FROM Students WHERE Marks BETWEEN 70 AND 90;

-- Display faculty salaries between $60,000 and $90,000.
SELECT * FROM Faculty WHERE Salary BETWEEN 60000 AND 90000;

-- Display placement packages between $80,000 and $120,000.
SELECT * FROM Placements WHERE Package BETWEEN 80000 AND 120000;


-- Part E: Membership Operators

-- IN
-- Display students belonging to Computer Science, Electronics, or Mechanical departments.
SELECT * FROM Students WHERE Department IN ('Computer Science', 'Electronics', 'Mechanical');

-- Display courses offered in Semester 1, Semester 3, or Semester 5.
SELECT * FROM Courses WHERE Semester IN (1, 3, 5);

-- Display placement companies located in New York, Dallas, or Seattle.
SELECT * FROM Companies WHERE Location IN ('New York', 'Dallas', 'Seattle');

-- NOT IN
-- Display students who do not belong to Civil, Mechanical, or Electrical departments.
SELECT * FROM Students WHERE Department NOT IN ('Civil', 'Mechanical', 'Electrical');

-- Display faculty members not assigned to Semester 1 or Semester 2.
SELECT * FROM Faculty WHERE Assigned_Semester NOT IN (1, 2);

-- Display books not belonging to Programming or Database categories.
SELECT * FROM Books WHERE Category NOT IN ('Programming', 'Database');


-- Part F: Pattern Matching

-- LIKE
-- Display students whose names start with the letter 'A'.
SELECT * FROM Students WHERE Name LIKE 'A%';

-- Display faculty members whose names end with the letter 'K'.
SELECT * FROM Faculty WHERE Name LIKE '%K';

-- Display course names containing the word "Data".
SELECT * FROM Courses WHERE Name LIKE '%Data%';

-- NOT LIKE
-- Display students whose names do not start with the letter 'S'.
SELECT * FROM Students WHERE Name NOT LIKE 'S%';

-- Display faculty members whose email addresses do not end with '.edu'.
SELECT * FROM Faculty WHERE Email NOT LIKE '%.edu';

-- Display company names that do not contain the word "Tech".
SELECT * FROM Companies WHERE Name NOT LIKE '%Tech%';


-- Part G: NULL Operators

-- IS NULL
-- Display students whose mobile number is not available.
SELECT * FROM Students WHERE Mobile_Number IS NULL;

-- Display faculty members whose email address is missing.
SELECT * FROM Faculty WHERE Email IS NULL;

-- Display placement records where the joining date has not yet been assigned.
SELECT * FROM Placements WHERE Joining_Date IS NULL;

-- IS NOT NULL
-- Display students whose mobile number is available.
SELECT * FROM Students WHERE Mobile_Number IS NOT NULL;

-- Display faculty members whose email address is available.
SELECT * FROM Faculty WHERE Email IS NOT NULL;

-- Display library books that have a return date.
SELECT * FROM Books WHERE Return_Date IS NOT NULL;


-- Part H: Assignment Operator (= in UPDATE)

-- Update the scholarship status of selected students.
UPDATE Scholarships SET Status = 'Approved' WHERE Student_ID = 1001;

-- Update the attendance percentage of students in a specific course.
UPDATE Students SET Attendance_Percentage = 85 WHERE Course_ID = 205;

-- Update the salary of faculty members in a specific department.
UPDATE Faculty SET Salary = 95000 WHERE Department = 'Computer Science';

-- Update the course fee for selected courses.
UPDATE Courses SET Fee = 1500 WHERE Course_ID IN (301, 302);

-- Update the hostel room charge for a specific hostel.
UPDATE Hostels SET Room_Charge = 1200 WHERE Hostel_ID = 15;

-- Update the placement status of selected students.
UPDATE Students SET Placement_Status = 'Placed' WHERE Student_ID IN (1005, 1008);

-- Update the return date for issued library books.
UPDATE Books SET Return_Date = '2023-11-30' WHERE Issue_Status = 'Issued';

-- Update the examination status for selected examinations.
UPDATE Examinations SET Status = 'Completed' WHERE Exam_ID = 502;

-- Update the room allocation status for selected hostel rooms.
UPDATE Hostel_Rooms SET Allocation_Status = 'Allocated' WHERE Room_Number = 101;
