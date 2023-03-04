CREATE DATABASE IF NOT EXISTS learning_management;
USE learning_management;

CREATE TABLE instructors (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  active boolean DEFAULT true,
  status varchar(255)
);

CREATE TABLE students (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL
);

CREATE TABLE teaching_levels (
  id int PRIMARY KEY AUTO_INCREMENT,
  codigo varchar(5) NOT NULL,
  description varchar(255)
);

CREATE TABLE semesters (
  id int PRIMARY KEY AUTO_INCREMENT,
  current_semester varchar(8) NOT NULL,
  current_semester_code varchar(2),
  description varchar(255)
);

CREATE TABLE courses (
  id int PRIMARY KEY AUTO_INCREMENT,
  instructor_id int,
  student_id int,
  semester_id int,
  teaching_level_id int,
  name varchar(255) NOT NULL,
  description varchar(255)
);

CREATE TABLE tasks (
  id int PRIMARY KEY AUTO_INCREMENT,
  course_id int,
  description varchar(255),
  task_note varchar(3),
  limit_note int DEFAULT 100 NOT NULL
);

SELECT * FROM tasks;

ALTER TABLE courses ADD FOREIGN KEY (teaching_level_id) REFERENCES teaching_levels (id);
ALTER TABLE courses ADD FOREIGN KEY (semester_id) REFERENCES semesters (id);
ALTER TABLE courses ADD FOREIGN KEY (student_id) REFERENCES students (id);
ALTER TABLE courses ADD FOREIGN KEY (instructor_id) REFERENCES instructors (id);

ALTER TABLE tasks ADD FOREIGN KEY (course_id) REFERENCES courses (id);

ALTER TABLE teaching_levels MODIFY COLUMN codigo varchar(5);
