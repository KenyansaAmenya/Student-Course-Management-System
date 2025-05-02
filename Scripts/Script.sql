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
course_name VARCHAR(50) not null,                                    -- name for the course
instructor_id INT,                                                   -- instructor id for the course
foreign key (instructor_id) references Instructors(instructor_id)    --This creates a relationship between the courses table and the instructors table.    
);

select * from instructors;    -- to see if the courses table has been created

create table enrollments (
enrollment_id INT primary key,                              -- unique ID for enrollments
student_id INT,                                             -- ID for each student from students table
foreign key (student_id) references students(student_id),   -- This creates a relationship between the enrollments table and the students table.
course_id INT,                                              -- ID for eahc course from the courses table.
foreign key (course_id) references Courses(course_id),      -- This creates a relationship between the enrollments table and the Courses table.
enrollment DATE
);

select * from enrollments;  --to see if the enrollment table has been created