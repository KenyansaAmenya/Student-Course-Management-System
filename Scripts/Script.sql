CREATE TABLE students (
    student_id INT PRIMARY KEY,           -- Unique ID for the student
    first_name VARCHAR(100) NOT null,   -- first Name of the student
    last_name VARCHAR(100) not null,    -- last name of the student
    email    VARCHAR(150)  not null,     -- email of the student
    date_of_birth DATE               -- student date of birth
    );

select * from students;