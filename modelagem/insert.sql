CREATE DATABASE IF NOT EXISTS learning_management;
USE learning_management;

INSERT INTO instructors (name, email, password)
VALUES ("Sr. Smith Sanchez", "smithsanchez@hulu.com", "kJtY#$*m123");

INSERT INTO instructors (name, email, password)
VALUES ("Sra. McDonald", "mcdonald@hulu.com", "kJtY#$*m123");

INSERT INTO students (name, email, password)
VALUES ("Julia Torvalds", "juliatorvalds@hulu.com", "kJtY#$*m123");

INSERT INTO students (name, email, password)
VALUES ("John Mayer", "mayer@hulu.com", "kJtY#$*m123");

SELECT * FROM instructors;
SELECT * FROM students;

INSERT INTO teaching_levels (codigo, description)
VALUES ("Lvl1", "Nível 1");

INSERT INTO teaching_levels (codigo, description)
VALUES ("Lvl", "Nível 2");

SELECT * FROM teaching_levels;

-- Semestre padrão americado
INSERT INTO semesters  (current_semester, current_semester_code, description)
VALUES ("2023/01", "S1", "Primavera");

INSERT INTO semesters  (current_semester, current_semester_code, description)
VALUES ("2023/02", "S2", "Verão");

SELECT * FROM semesters;

-- INSERt STUDENT JOHN
INSERT INTO courses (instructor_id, student_id, semester_id, teaching_level_id, name, description)
VALUES (1, 2, 1, 1, "Inglês Básico", "Gramática de uso da língua inglesa");

INSERT INTO courses (instructor_id, student_id, semester_id, teaching_level_id, name, description)
VALUES (2, 2, 2, 2, "Inglês Intermediário", "Conversação da língua inglesa");

INSERT INTO courses (instructor_id, student_id, semester_id, teaching_level_id, name, description)
VALUES (2, 1, 2, 2, "Inglês Intermediário", "Conversação da língua inglesa");

SELECT * FROM courses;
-- SELECT id FROM courses;
-- DELETE FROM courses where id in (1,2,3,4,6);

SELECT * FROM tasks;

INSERT INTO tasks (course_id, description, task_note)
VALUES (5, "Tarefa 1 (Teste Gramatical)", "95")

INSERT INTO tasks (course_id, description, task_note)
VALUES (5, "Tarefa 2 (Teste conversação)", "")

-- Extract data to xlsx
SELECT
	tasks.description AS task_description,
	tasks.task_note,
	tasks.limit_note,
	students.name AS student_name,
	CONCAT(teaching_levels.description , " - ", courses.name) AS couse_name,
	courses.description AS course_description,
	CONCAT(semesters.description, " - ", semesters.current_semester) AS current_semester,
	instructors.name AS instructor_name
FROM courses
INNER JOIN instructors ON instructors.id = courses.instructor_id
INNER JOIN students ON students.id = courses.student_id
INNER JOIN semesters ON semesters.id = courses.semester_id
INNER JOIN teaching_levels ON teaching_levels.id = courses.teaching_level_id
LEFT JOIN tasks ON tasks.course_id = courses.id;

