CREATE DATABASE IF NOT EXISTS JKLU_PYQ_Database;
USE JKLU_PYQ_Database;
CREATE TABLE Institute (
    InstituteID INT PRIMARY KEY,
    InstituteName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Duration INT NOT NULL,
    InstituteID INT NOT NULL,

    FOREIGN KEY (InstituteID)
        REFERENCES Institute(InstituteID)
);
CREATE TABLE Subject (
    SubjectCode VARCHAR(20) PRIMARY KEY,
    SubjectName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    CourseID INT NOT NULL,

    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);
CREATE TABLE ExamType (
    ExamType VARCHAR(20) PRIMARY KEY
);
INSERT INTO ExamType (ExamType)
VALUES
    ('Mid Term'),
    ('End Term'),
    ('Quiz');
CREATE TABLE QuestionPaper (
    PaperID INT PRIMARY KEY,
    AcademicYear VARCHAR(9) NOT NULL,
    Semester INT NOT NULL,
    ExamType VARCHAR(20) NOT NULL,
    ExamDate DATE,
    MaxMarks INT NOT NULL,
    Duration INT NOT NULL,
    InstituteID INT NOT NULL,
    CourseID INT NOT NULL,
    SubjectCode VARCHAR(20) NOT NULL,

    FOREIGN KEY (ExamType)
        REFERENCES ExamType(ExamType),

    FOREIGN KEY (InstituteID)
        REFERENCES Institute(InstituteID),

    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID),

    FOREIGN KEY (SubjectCode)
        REFERENCES Subject(SubjectCode),

    CHECK (Semester > 0),
    CHECK (MaxMarks > 0),
    CHECK (Duration > 0)
);
CREATE TABLE Question (
    PaperID INT NOT NULL,
    QuestionNo INT NOT NULL,
    QuestionText TEXT NOT NULL,
    Marks DECIMAL(6,2) NOT NULL,
    DifficultyLevel VARCHAR(20),

    PRIMARY KEY (PaperID, QuestionNo),

    FOREIGN KEY (PaperID)
        REFERENCES QuestionPaper(PaperID),

    CHECK (QuestionNo > 0),
    CHECK (Marks > 0),

    CHECK (
        DifficultyLevel IS NULL
        OR DifficultyLevel IN ('Easy', 'Medium', 'Hard')
    )
);
CREATE TABLE SubPart (
    PaperID INT NOT NULL,
    QuestionNo INT NOT NULL,
    SubPartNo VARCHAR(5) NOT NULL,
    SubPartText TEXT NOT NULL,
    Marks DECIMAL(6,2) NOT NULL,

    PRIMARY KEY (PaperID, QuestionNo, SubPartNo),

    FOREIGN KEY (PaperID, QuestionNo)
        REFERENCES Question(PaperID, QuestionNo),

    CHECK (Marks > 0)
);
SHOW TABLES ;
SELECT * FROM Course;
SELECT * FROM Subject; 
SELECT * FROM QuestionPaper;
SELECT * FROM Question;
SELECT * FROM SubPart;
ALTER TABLE QuestionPaper
DROP COLUMN ExamType;
DROP TABLE ExamType;

-- rename the database --

CREATE DATABASE paperQ;
RENAME TABLE JKLU_PYQ_Database.Institute
TO paperQ.Institute;

RENAME TABLE JKLU_PYQ_Database.Course
TO paperQ.Course;

RENAME TABLE JKLU_PYQ_Database.Subject
TO paperQ.Subject;

RENAME TABLE JKLU_PYQ_Database.QuestionPaper
TO paperQ.QuestionPaper;

RENAME TABLE JKLU_PYQ_Database.Question
TO paperQ.Question;

RENAME TABLE JKLU_PYQ_Database.SubPart
TO paperQ.SubPart;

USE paperQ;
SHOW TABLES;