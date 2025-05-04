# Student-Course-Management-System
# 1. Project overview/Description
In this project I was tasked to create A relational database system for managing student course enrollments, grades, and instructor assignments.  This project simulates a real-world educational platform where students enroll in courses taught by instructors then tracks academic records and provides analytical insights through optimized SQL queries. I was able to complete the project using postgress sql using Dbeaver as my database administrator connected to Aiven as my database host.
# 2. ERD (Entity Relationship Diagram)

# 3. Instructions to run the SQL Code
# Using pgAdmin connected to Aiven
a. Create database: Right-click "Databases" → "Create" → Name: Course_management.
b. Run schema script: Open schema.sql → Execute
c. Load data in my case the tables then execute
d. Run queries 
# 4. Explanation of the schema
The system uses a relational model with 4 core tables and 1 audit log table to track academic operations:
a. student table: stores student demographics/details
b. courses table: contains course catalog.
c. Instructors table: Manages faculty data i.e instructors and courses they offer.
d. Enrollments table: Tracks students course relationship
e. enrollment_logs table: records all enrollment changes
# Relationships
a. between students and enrollments: one-to-many
students can get enrolled to multiple courses
b. between courses and enrollments: one-to-many
a course can have multiple enrolled students
c. between instructors and courses: one-to-many
an instructor can teach multiple courses
# 5. Description of key queries

# a. Query 1 to check Students who enrolled in at least one course.

# b. Query 2 to check students who are enrolled in more than one course

# c. Query 3 to check courses with total enrolled students

# d. query 4 to check average grade per course

# e. query 5 to see students who havent enrolled in any course

# f. Query 6 students with average grades across all courses

# g. Query 7 Instructors with the number of courses they teach

# h. Query 8 students enrolled in a course taught by " "

# i. Query 9 top 3 students by average grade

# j. Query 10 Students failing(grade = 'F') in more than one course

# k. Query 11 Create a view named student_course_summary(student name, course, grade)

# l. query 12 add an index on enrollments.student_id

# m. query 13 Create a trigger or stored procedure that logs new enrollments


