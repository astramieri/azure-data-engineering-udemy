CREATE TABLE Student
(
    StudentID VARCHAR(100) NOT NULL,
    StudentName VARCHAR(1000)
);

ALTER TABLE Student
ADD CONSTRAINT PK_Student PRIMARY KEY (StudentID);
