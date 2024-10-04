CREATE TABLE Course
(
    CourseID VARCHAR(100) NOT NULL,
    CourseName VARCHAR(1000),
    Price REAL
);

ALTER TABLE Course
ADD CONSTRAINT PK_Course PRIMARY KEY (CourseID);
