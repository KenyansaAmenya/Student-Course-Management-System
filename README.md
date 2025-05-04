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
![output for students enrolled in atleast 1 course](https://github.com/user-attachments/assets/bc146d4f-0fa9-4695-9a75-1008bda2d888)
# b. Query 2 to check students who are enrolled in more than one course
![Output for students enrolled in more than 1 course](https://github.com/user-attachments/assets/3a31ce7a-780b-4d5f-9776-a98bd2b99383)
# c. Query 3 to check courses with total enrolled students
![courses with total enrollment of students](https://github.com/user-attachments/assets/d66b53f3-901c-45de-a156-3a167129a829)
# d. query 4 to check average grade per course
![Average grade per course](https://github.com/user-attachments/assets/3c79403c-285d-4710-ba7b-6b7f7d9ae1d1)
# e. query 5 to see students who havent enrolled in any course
![student who have not enrolled in any course](https://github.com/user-attachments/assets/61e527f2-0251-41dd-8030-606fcdc2268f)
# f. Query 6 students with average grades across all courses
![Average grade across all courses](https://github.com/user-attachments/assets/f060f8cb-559f-44d7-86ff-f9568940d6d1)
# g. Query 7 Instructors with the number of courses they teach
![Instructors courses](https://github.com/user-attachments/assets/5e4a2d93-6e16-489a-ab33-3c5606875475)
# h. Query 8 students enrolled in a course taught by "John Doe"
![student enroled to](https://github.com/user-attachments/assets/74671b8d-b4c1-4dc0-9525-996cc54a44f4)
# i. Query 9 top 3 students by average grade
![top 3 changes by average](https://github.com/user-attachments/assets/06ae3275-dfcf-4bfc-985b-87dbb02f791e)
# j. Query 10 Students failing(grade = 'F') in more than one course
![students with grade F](https://github.com/user-attachments/assets/dcca53ea-3182-4926-b015-25cbbc594c3b)
# k. Query 11 Create a view named student_course_summary(student name, course, grade)
![student course summary view](https://github.com/user-attachments/assets/5971acbf-ce33-4b5f-b48c-8723c1e30629)
# l. query 12 add an index on enrollments.student_id
![Index](https://github.com/user-attachments/assets/e20f8bc4-21c2-49fe-a106-068e7eaf207f)
# m. query 13 Create a trigger or stored procedure that logs new enrollments
![trigger function](https://github.com/user-attachments/assets/364cca4f-8a6c-41c2-af60-49f852adc6bb)
# Challenges
Creating triggers  or stored procedure that logs new enrollments was the most complext task undertaken i had to use a few resources to get it right.
Although I was able to use joins effectively inner, outer, left & right join are challenging to me.
# Lessons learnt 
always be careful when creating tables and inserting values because any slight mistake will force you to start all over or drop the entire table.
for smoother join always include foreign keys whenever necessary.


