-- add questions

ALTER TABLE QUESTION_PAPER
MODIFY COLUMN Semester VARCHAR(30) NOT NULL;

USE paper_Q;

-- 1. Programming-II: BCA, Semester III
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'III', 'Final Exam', '2023-12-14',
       30, 120, 'CS1135', 1
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'CS1135'
      AND Academic_Year = '2023-24'
      AND Semester = 'III'
      AND Examination_Type = 'Final Exam'
);

-- 2. Game Design and Development: B.Tech, Semesters V and VI
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'V & VI', 'End Term Exam', NULL,
       30, 120, 'CS1227', 2
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'CS1227'
      AND Academic_Year = '2023-24'
      AND Semester = 'V & VI'
      AND Examination_Type = 'End Term Exam'
);

-- 3. Accounting for Business: BCA, Semester III
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'III', 'End Term Exam', NULL,
       30, 90, 'IL1104', 1
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'IL1104'
      AND Academic_Year = '2023-24'
      AND Semester = 'III'
      AND Examination_Type = 'End Term Exam'
);

-- 4. Linear Algebra: B.Tech, Semester II
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2024-25', 'II', 'Mid Term II', '2025-03-11',
       20, 120, 'AS1114', 2
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'AS1114'
      AND Academic_Year = '2024-25'
      AND Semester = 'II'
      AND Examination_Type = 'Mid Term II'
);

-- 5. Industrial Safety Management: B.Tech, Semester VII
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'VII (Backlog)', 'End Term Exam', NULL,
       30, 150, 'ME2101', 2
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'ME2101'
      AND Academic_Year = '2023-24'
      AND Semester = 'VII (Backlog)'
      AND Examination_Type = 'End Term Exam'
);

-- 6. Services Marketing: BBA, Semester III
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'III', 'End Term Exam', NULL,
       30, 120, 'MA1127', 3
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'MA1127'
      AND Academic_Year = '2023-24'
      AND Semester = 'III'
      AND Examination_Type = 'End Term Exam'
);

-- 7. Sales in Retail Banking & Insurance: BBA, Semester V
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'V', 'End Term Exam', NULL,
       30, 120, 'MA1106', 3
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'MA1106'
      AND Academic_Year = '2023-24'
      AND Semester = 'V'
      AND Examination_Type = 'End Term Exam'
);

-- 8. Consumer Behaviour & Brand Management in BFSI: BBA, Semester V
INSERT INTO QUESTION_PAPER
(Academic_Year, Semester, Examination_Type, Examination_Date,
 Maximum_Marks, Duration, Subject_Code, Course_ID)
SELECT '2023-24', 'V', 'End Term Exam', NULL,
       30, 120, 'MA1105', 3
WHERE NOT EXISTS (
    SELECT 1 FROM QUESTION_PAPER
    WHERE Subject_Code = 'MA1105'
      AND Academic_Year = '2023-24'
      AND Semester = 'V'
      AND Examination_Type = 'End Term Exam'
);

-- Verify inserted papers
SELECT
    QP.Paper_ID,
    QP.Subject_Code,
    S.Subject_Name,
    C.Course_Name,
    QP.Academic_Year,
    QP.Semester,
    QP.Examination_Type,
    QP.Examination_Date,
    QP.Maximum_Marks,
    QP.Duration
FROM QUESTION_PAPER QP
JOIN SUBJECT S ON QP.Subject_Code = S.Subject_Code
JOIN COURSE C ON QP.Course_ID = C.Course_ID
ORDER BY QP.Paper_ID;


USE paper_Q;

SELECT
    QP.Paper_ID,
    S.Subject_Name,
    COUNT(Q.Question_Number) AS Total_Questions,
    COALESCE(SUM(Q.Marks), 0) AS Recorded_Marks,
    QP.Maximum_Marks
FROM QUESTION_PAPER QP
JOIN SUBJECT S
    ON QP.Subject_Code = S.Subject_Code
LEFT JOIN QUESTION Q
    ON QP.Paper_ID = Q.Paper_ID
GROUP BY
    QP.Paper_ID,
    S.Subject_Name,
    QP.Maximum_Marks
ORDER BY QP.Paper_ID;