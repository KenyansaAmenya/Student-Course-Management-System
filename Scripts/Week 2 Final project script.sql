create schema course_management;

CREATE TABLE students (
    student_id INT PRIMARY KEY,           -- Unique ID for the student
    first_name VARCHAR(100) NOT null,   -- first Name of the student
    last_name VARCHAR(100) not null,    -- last name of the student
    email    VARCHAR(150)  not null,     -- email of the student
    date_of_birth DATE               -- student date of birth
    );

select * from students;   -- to see if the students table has been created

create table Instructors (
instructor_id INT primary key,    -- unique id for the instructor
first_name VARCHAR(50) not null,   -- first name of the instructor
last_name VARCHAR(50) not null,    -- last name of the instructor
email VARCHAR(50)                  --email of the instructor
);

select * from instructors;   -- to see if the instructors table has been created

create table Courses (
course_id INT primary key,                                           --unique id for each course
course_name VARCHAR(50) not null,                                   -- name for the course
course_description TEXT,
instructor_id INT,                                                   -- instructor id for the course
foreign key (instructor_id) references Instructors(instructor_id)    --This creates a relationship between the courses table and the instructors table.    
);

select * from courses;    -- to see if the courses table has been created


create table enrollments (
enrollment_id INT primary key,                              -- unique ID for enrollments
student_id INT,                                             -- ID for each student from students table
foreign key (student_id) references students(student_id),   -- This creates a relationship between the enrollments table and the students table.
course_id INT,                                              -- ID for eahc course from the courses table.
foreign key (course_id) references Courses(course_id),      -- This creates a relationship between the enrollments table and the Courses table.
enrollment_date DATE,
grades VARCHAR(1)
);

select * from enrollments;  --to see if the enrollment table has been created

-- insert statements for students
insert into students (student_id, first_name, last_name, email, date_of_birth )
VALUES
(1, 'Martin', 'Otieno', 'otienomartin@gmail.com', '1994-06-24'),
(2, 'Kevin', 'Omolo','otienomartin@gmail.com', '1994-06-24'),
(3, 'John', 'Wafula', 'otienomartin@gmail.com', '1996-11-10'),
(4, 'Liz', 'Wambui', 'wambui2025@gmail.com', '1990-12-12'),
(5, 'William', 'Kamau', 'kamauwilliam@gmail.com', '1994-07-12'),
(6, 'Peter', 'Momanyi', 'momanyi26@gmail.com', '1995-06-27'),
(7, 'Monica', 'Atieno', 'atieno56@gmail.com', '1992-09-07'),
(8, 'Patrick', 'Chacha', 'chachapatrick@gmail.com', '1993-01-14'),
(9, 'Peter', 'Wepukhulu', 'wepukhulupeter@gmail.com', '1988-10-25'),
(10, 'Thomas', 'Omondi', 'omondithomas@gmail.com', '1993-09-16'),
(11, 'Tom', 'Mogaka', 'mogaka70@gmail.com', '1989-07-19'),
(12, 'Selina', 'Wakesho', 'otienomartin@gmail.com', '1997-04-29'),
(13, 'Mary', 'Wanjiru','wanjirumary@gmail.com', '1995-02-16'),
(14, 'Eve', 'Sharon', 'sharon45@gmail.com', '1980-01-20'),
(15, 'Pauline', 'Fatuma', 'fatumapauline@gmail.com', '1991-08-12'),
(16, 'Cythia', 'Kerubo', 'kerubocythia@gmail.com', '1990-10-01');

select * from students;   -- to check if the insert statements have been added to the students table

-- insert statements for instructors
insert into instructors (instructor_id, first_name, last_name, email)
values
(60, 'Mohammed', 'Ahmed', 'mohaahmed@gmail.com'),
(61, 'Elizabeth', 'Moraa', 'moraaliz@gmail.com'),
(62, 'Mary', 'Wafula', 'mary1994@gmail.com'),
(63, 'Daniel', 'Oloo', 'oloodaniel@gmail.com'),
(65, 'Fauziah', 'Ahmed', 'fauziah67@gmail.com');

select * from instructors;  -- to check if the insert statements have been added to the instructors table

-- insert statement for courses table 
insert into courses (course_id, course_name, instructor_id, course_description)
values
(101, 'Medicine', 63, 'This course covers human anatomy, physiology, diseases, and treatments. Students learn diagnosis, patient care, and medical ethics through theory and clinical practice. Prepares graduates for careers in healthcare, research, or specialization.'),
(102, 'Computer science', 65, 'This course covers programming, algorithms, data structures, and software development. Students learn coding, problem-solving, and system design, preparing for careers in tech, AI, cybersecurity, and software engineering.'),
(103, 'Economics', 60, 'This course covers microeconomics, macroeconomics, and development, preparing for careers in finance, policy, or research.'),
(104, 'Engineering', 62, 'This course applies science and math to design solutions for real-world problems. Students learn technical skills in specialized fields such as civil, mechanical, & electrical, developing innovations that shape infrastructure, technology, and society.'),
(105, 'Startistics', 61, 'This course teaches data collection, analysis, and interpretation using mathematical models. Covers probability, hypothesis testing, and machine learning foundations, preparing students for careers in data science, research, and analytics.');

select * from courses;   -- to check if the insert statements have been added to courses table.

-- insert statements for enrollment table
insert into enrollments (enrollment_id, student_id, course_id, enrollment_date, grades)
values
(1,  16, 104, '2025-01-05', 'A'),
(2,  12, 102, '2025-01-07', 'B'),
(3,  10, 101, '2025-01-07', 'A'),
(4,  11, 104, '2025-01-07', 'A'),
(5,  2,  101, '2025-01-07', 'A'),
(6,  1,  103, '2025-01-07', 'B'),
(7,  4,  105, '2025-01-07', 'B'),
(8,  5,  105, '2025-01-07', 'B'),
(9,  7,  104, '2025-01-07', 'B'),
(10, 6,  103, '2025-01-07', 'C'),
(11, 8,  103, '2025-01-07', 'B'),
(12, 13, 102, '2025-01-07', 'B'),
(13, 15, 102, '2025-01-07', 'A'),
(14, 1,  105, '2025-01-07', 'A'),
(15, 3,  104, '2025-01-07', 'B'),
(16, 4,  103, '2025-01-07', 'B');


select * from enrollments;   -- to check if the insert statements have been added to enrollment table.


-- Query 1 to check Students who enrolled in at least one course.

select distinct                                     -- distinct ensures each student appears only once
s.student_id,                                       -- student's unique identifier
s.first_name,                                       -- student's first name
s.last_name                                         -- student's last name
from students s                                     -- table containing student info
join 
enrollments e                                       -- Enrollments table linking students to courses
on s.student_id = e.student_id                      -- Join condition matching students to their enrollments 
order by s.student_id;                              -- Sort students by ascending order



-- Query 2 to check students who are enrolled in more than one course
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    COUNT(e.course_id) AS number_of_courses               -- count of courses each student is enrolled in
FROM 
    students s                                            -- table containing student info
JOIN 
    enrollments e                                         -- Enrollments table linking students to courses
    ON s.student_id = e.student_id                        -- Join condition matching students to their enrollments
GROUP BY                                                  -- Group by student to aggregate their course enrollments
    s.student_id, s.first_name, s.last_name
HAVING 
    COUNT(e.course_id) > 2                                -- Only include students with more than 2 course enrollments
ORDER BY 
    number_of_courses asc;                                -- sort results lowest to highest


-- Query 3 to check courses with total enrolled students
select 
c.course_name,                                             -- name of the course
COUNT(e.student_id) as total_enrolled_students             -- Counts student in each course
from 
courses c                                                  -- table containing course info
left join                                                  -- LEFT JOIN to ensures all courses are included
enrollments e 
on c.course_id = e.course_id                               -- Join condition matching courses to enrollments
group by 
c.course_id,                                               -- Group by course to aggregate enrollment counts
c.course_name
order by 
total_enrolled_students desc;                              -- sort by enrollment count


-- query 4 to check average grade per course
-- 1. Number of enrolled students per course
-- 2. Average numeric grade for each course
select 
c.course_name,                                          -- name of the course
COUNT(e.student_id) AS enrolled_students,               -- Count of students enrolled in each course
-- calculate average grade (A=4, B=3, C=2, D=1, F=0)
AVG(case
	when e.grades = 'A' then 4
	when e.grades = 'B' then 3
	when e.grades = 'C' then 2
	when e.grades = 'D' then 1
	when e.grades = 'F' then 0
	else null                                           -- Default value for any unexpected grade values
end) as average_grade                                   -- Resulting average numeric grade for the course
FROM 
    courses c                                           -- main courses table
LEFT JOIN                                               -- LEFT JOIN to include courses with no enrollments
    enrollments e 
    ON c.course_id = e.course_id                        -- Join courses with enrollment records
GROUP BY 
    c.course_name                                       -- Group results by course name to aggregate outcome
ORDER BY 
    average_grade DESC;                                 -- Sort courses by highest average grade first

-- query 5 to see students who havent enrolled in any course
-- This query returns a list of students with no enrollment records
select
s.student_id,                                            -- student's unique identifier
s.first_name,                                            -- student's first name
s.last_name                                              -- student's last name
from 
students s                                               -- mani student table
left join                                                -- LEFT JOIN is used to include all students
enrollments e                                            -- Enrollment records table
on s.student_id = e.student_id                           -- Match students to their enrollments
where 
e.student_id is null                                     -- Filter for only students with NO enrollments
order by                                                 -- sort by first then last name 
s.first_name, 
s.last_name;


-- Query 6 students with average grades across all courses
select 
    s.student_id,                          -- unique id for the student
    s.first_name,                          -- first name of the student
    s.last_name,                           -- last name of the student
    AVG(case                               -- Calculate numeric average of grades by converting letter grades to numbers:
        when e.grades = 'A' then 4
        when e.grades = 'B' then 3
        when e.grades = 'C' then 2
        when e.grades = 'D' then 1
        when e.grades = 'F' then 0
        ELSE null                          -- Exclude any non-standard grades from average
    end) as average_grade
from
    students s                             -- Main students table
inner join                                 -- Use INNER JOIN to only include students with enrollments
    enrollments e                          -- enrollment records table
    on s.student_id = e.student_id         -- match students to their course enrollments
group by                                   -- Group by student to aggregate all their grades
    s.student_id,
    s.first_name,
    s.last_name
order by                                   -- Sort by highest average grade first
    average_grade desc;


-- Query 7 Instructors with the number of courses they teach
-- Query to count how many courses each instructor teaches
-- Returns instructor details with their course count
select 
i.instructor_id,                                        -- unique id for the instructor
i.first_name,                                           -- instructors first name
i.last_name,                                            -- instructors last name
COUNT (c.course_id)as number_of_courses                 -- Count of courses taught by each instructor
from 
instructors i                                           -- main instructors table
left join                                               -- to include all instructors we use left join
courses c                                               -- Courses table 
on i.instructor_id = c.instructor_id                    -- Matching instructors to their courses
group by                                                -- Group by instructor to aggregate their course count
i.instructor_id,
i.first_name,
i.last_name
order by
number_of_courses desc;                                 -- Sort by course count


-- Query 8 students enrolled in a course taught by " "
-- Query to find all students enrolled in courses taught by instructor 'Daniel Oloo' or any other
-- Returns student information along with the specific course names they're enrolled in
select 
    s.student_id,                                       -- unique student identifier
    s.first_name,                                       -- first name of the student
    s.last_name,                                        -- last name 
    c.course_name                                       -- name of course taught by 'Daniel Oloo'   
from 
    students s                                          -- Main students table
inner join                                              -- INNER JOIN - only students with enrollments
    enrollments e                                       -- Nain enrollment records table
    on s.student_id = e.student_id                      -- to match students to their enrollments
inner join 
    courses c                                           -- Main courses table 
    on e.course_id = c.course_id                        -- Match enrollments to courses
inner join 
    instructors i                                       -- Main instructors table
on c.instructor_id = i.instructor_id                    -- Match courses to their instructors                   
where 
    i.first_name = 'Daniel'                             -- Filter for instructor's first name
    and i.last_name = 'Oloo'                            -- Filter for instructor's last name
order by
       s.last_name,                                     -- sorting the result in 
       s.first_name,
       c.course_name;

-- Query 9 top 3 students by average grade
-- Convert letter grades to numeric values and calculate averages
select 
    s.student_id,                                        -- unique student indentifier
    s.first_name,                                        -- student's first name
    s.last_name,                                         -- student's last name
    -- Calculate average grade (A=4, B=3, C=2, D=1, F = 0)
    AVG(case 
        when e.grades = 'A' then 4
        when e.grades = 'B' then 3
        when e.grades = 'C' then 2
        when e.grades = 'D' then 1
        when e.grades = 'F' then 0
        ELSE null                                        -- Handles any unexpected grades
    end) AS average_grade
from 
    students s                                           -- main student table
join 
    enrollments e                                       -- enrollment records table
    ON s.student_id = e.student_id                      -- Connect students to their enrollments
group by 
    s.student_id,                                       -- Group by student
    s.first_name, 
    s.last_name                                         
having 
    COUNT(e.course_id) > 0                              -- Only includes students with at least one course
order by 
    average_grade DESC                                  -- Sort from highest to lowest average
limit 3;                                                -- to return only the top 3 students


-- Query 10 Students failing(grade = 'F') in more than one course
select 
s.student_id,                                           -- unique indentifier for each student
s.first_name,                                           -- student's first name
s.last_name,                                            -- students last name
count(e.course_id) as failing_courses                   -- Count of courses with 'F' grade per student
from 
students s                                              -- main students table
join                                                    -- Join with enrollments to access grade information
enrollments e                                           -- enrollment records
on s.student_id = e.student_id                          -- Match students to their enrollment records
where 
e.grades = 'F'                                          -- Filter to only include failing grades ('F')
-- Group by student to aggregate their failing courses:
group by 
s.student_id, 
s.first_name,
s.last_name
order by 
failing_courses;                                        -- Sort results by number of failing courses


-- part 4: Query 1 Create a view named student_course_summary(student name, course, grade)
create view student_course_summary as
select 
concat(s.first_name, ' ', s.last_name) as student_name, -- this is to combine the first  and last name
c.course_name as course,                                -- course name
e.grades as grade                                       -- students grades
from 
students s
join 
enrollments e on s.student_id = e.student_id             -- connect students to enrollments
join
courses c on e.course_id = c.course_id;                  -- connects enrollments to courses

select * from student_course_summary;                    -- to see if the student_course_summary view has been created

-- part 4: query 2 add an index on enrollments.student_id
-- create an index on the student_id column in the enrollment table
create index idx_enrollments_student_id on enrollments(student_id);

SELECT * FROM pg_indexes WHERE tablename = 'enrollments';   -- query to view the index in the enrollment table


-- part 4: query 3 Create a trigger or stored procedure that logs new enrollments
-- step 1 create a table to store enrollment logs 
create table enrollment_logs (
log_id serial primary key,                                        -- Auto-incrementing unique identifier for each log entry
student_id int not null,                                          -- References the student involved in the enrollment change
course_id int not null,                                           -- References the course involved in the enrollment change
enrollment_date date,                                             -- Original enrollment date from the enrollments table
action varchar(10) not null,                                      -- possible value: 'INSERT', 'UPDATE', 'DELETE'
changed_at timestamp default current_timestamp,                   -- Automatically records current date/time
changed_by varchar(50) default current_user);                     -- Automatically records the database user

select * from enrollment_logs;                                    -- to view if enrollment_logs table has been created

-- step two creating a trigger that logs new enrollments
create function log_new_enrollment()
returns trigger as $$                                             -- Specifies this is a trigger function
begin 
-- Insert a record into the log table when a new enrollment is added
	insert into                                                   -- Insert a record into the log table when a new enrollment is added
 enrollment_logs(
	student_id,                                                   -- Student involved in the enrollment
	course_id,                                                    -- Course being enrolled in
	enrollment_date,                                              -- Date of enrollment
	action,                                                       -- Type of operation ('Insert')
	changed_by)                                                   -- Database user who performed the operation
	values(
	new.student_id,                                               -- Accessing the newly inserted student_id
	new.course_id,                                                -- Accessing the newly inserted course_id
	new.enrollment_date,                                          -- Accessing the enrollment date
	'Insert',                                                     -- Hardcoded action type since this is an insert trigger
	current_user                                                  -- Automatically capture the current DB user
	);
 -- Return the new row (required for AFTER INSERT triggers)
return new;
end;
$$ language plpgsql;                                              -- Specifies this is a PL/pgSQL function

-- create and attach the trigger to the enrollments table
create trigger trg_log_enrollment
after insert on enrollments                                       -- Trigger fires after each new row is inserted
for each row                                                      -- Operates on each affected row individually
execute function log_new_enrollment();                            -- Calls our logging function


-- How to View all triggers on the enrollments table
SELECT tgname AS trigger_name, 
       tgenabled AS status,
       tgtype AS trigger_type
FROM pg_trigger
WHERE tgrelid = 'enrollments'::regclass;

-- View trigger details including the function
SELECT trigger_name, 
       event_manipulation AS trigger_event,
       action_statement AS trigger_definition
FROM information_schema.triggers
WHERE event_object_table = 'enrollments';

-- View the trigger function definition
SELECT prosrc AS function_definition
FROM pg_proc
WHERE proname = 'log_new_enrollment';

