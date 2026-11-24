CREATE DATABASE IF NOT EXISTS paper_Q;
USE paper_Q;

-- 1. INSTITUTE
CREATE TABLE INSTITUTE (
    Institute_ID INT PRIMARY KEY AUTO_INCREMENT,
    Institute_Name VARCHAR(150) NOT NULL
);

-- 2. COURSE
CREATE TABLE COURSE (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(100) NOT NULL,
    Duration INT NOT NULL,
    Institute_ID INT NOT NULL,

    FOREIGN KEY (Institute_ID)
        REFERENCES INSTITUTE(Institute_ID)
);

-- 3. SUBJECT
CREATE TABLE SUBJECT (
    Subject_Code VARCHAR(20) PRIMARY KEY,
    Subject_Name VARCHAR(150) NOT NULL,
    Credits INT NOT NULL,
    Course_ID INT NOT NULL,

    FOREIGN KEY (Course_ID)
        REFERENCES COURSE(Course_ID)
);

-- 4. QUESTION_PAPER
CREATE TABLE QUESTION_PAPER (
    Paper_ID INT PRIMARY KEY AUTO_INCREMENT,
    Academic_Year VARCHAR(9) NOT NULL,
    Semester INT NOT NULL,
    Examination_Type VARCHAR(50) NOT NULL,
    Examination_Date DATE,
    Maximum_Marks DECIMAL(5,2) NOT NULL,
    Duration INT NOT NULL,
    Subject_Code VARCHAR(20) NOT NULL,
    Course_ID INT NOT NULL,

    FOREIGN KEY (Subject_Code)
        REFERENCES SUBJECT(Subject_Code),

    FOREIGN KEY (Course_ID)
        REFERENCES COURSE(Course_ID)
);

-- 5. QUESTION
CREATE TABLE QUESTION (
    Paper_ID INT NOT NULL,
    Question_Number INT NOT NULL,
    Question_Text TEXT NOT NULL,
    Marks DECIMAL(5,2) NOT NULL,
    Difficulty_Level VARCHAR(20),

    PRIMARY KEY (Paper_ID, Question_Number),

    FOREIGN KEY (Paper_ID)
        REFERENCES QUESTION_PAPER(Paper_ID)
        ON DELETE CASCADE
);

-- 6. SUB_PART
CREATE TABLE SUB_PART (
    Paper_ID INT NOT NULL,
    Question_Number INT NOT NULL,
    Sub_Part_Number VARCHAR(10) NOT NULL,
    Sub_Part_Text TEXT NOT NULL,
    Marks DECIMAL(5,2) NOT NULL,

    PRIMARY KEY (
        Paper_ID,
        Question_Number,
        Sub_Part_Number
    ),

    FOREIGN KEY (Paper_ID, Question_Number)
        REFERENCES QUESTION(Paper_ID, Question_Number)
        ON DELETE CASCADE
);
SHOW TABLES;
USE paper_Q;
SELECT DATABASE();
INSERT INTO INSTITUTE (Institute_Name)
VALUES
    ('Institute of Engineering and Technology'),
    ('Institute of Management'),
    ('Institute of Design');

SELECT * FROM INSTITUTE;
