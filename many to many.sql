CREATE TABLE students(
	student_id INT PRIMARY KEY,
	name VARCHAR(50),
	adress VARCHAR(50),
	phone VARCHAR(50),
);


INSERT INTO students (student_id, name, adress, phone, )
VALUES (1, 'Okan Uludag', 'Nystadsgatan 25', '0762247264'),
	   (2, 'Frank Svensson', 'Bergengatan 32', '0724248589'),
	   (3, 'Kasper Magnussson', 'Gotgatan 20', '0789811255',);


CREATE TABLE classes(
	class_id INT PRIMARY KEY,
	name VARCHAR (50),
	instructor VARCHAR(50),
	meeting_times DATETIME
);

INSERT INTO classes (class_id, name, instructor, meeting_times)
VALUES (1, 'Math', 'Professor Andersson', '2022-01-05 12:30:00'),
	   (2, 'Chemistry', 'Professor Svensson', '2022-02-01 15:00:00');

CREATE TABLE enrollment(
	student_id INT,
	class_id INT,
	PRIMARY KEY (student_id, class_id),
	FOREIGN KEY (student_id) REFERENCES students (student_id),
	FOREIGN KEY (class_id) REFERENCES classes (class_id)
);

INSERT INTO enrollment (student_id, class_id)
VALUES(1,1),
	  (1,2),
	  (2,1),
	  (3,1);

SELECT s.name AS student_name, c.name AS class_name,c.instructor, c.meeting_times
FROM classes c
JOIN enrollment e ON c.class_id = e.class_id
JOIN students s ON e.student_id = s.student_id;

