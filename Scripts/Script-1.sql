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


-- Query to check Students who enrolled in at least one course.

select distinct s.student_id, s.first_name, s.last_name
from students s
join enrollments e on s.student_id = e.student_id
order by s.student_id;

-- Query to check students who are enrolled in more than one course

SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    COUNT(e.course_id) AS number_of_courses
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_id, s.first_name, s.last_name
HAVING 
    COUNT(e.course_id) > 2
ORDER BY 
    number_of_courses DESC;






