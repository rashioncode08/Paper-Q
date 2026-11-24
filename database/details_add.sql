USE paper_Q;

-- Get institute IDs
SET @eng_id = (
    SELECT Institute_ID FROM INSTITUTE
    WHERE Institute_Name = 'Institute of Engineering and Technology'
    LIMIT 1
);

SET @mgmt_id = (
    SELECT Institute_ID FROM INSTITUTE
    WHERE Institute_Name = 'Institute of Management'
    LIMIT 1
);

-- Add BCA under Engineering and Technology
INSERT INTO COURSE (Course_Name, Duration, Institute_ID)
SELECT 'BCA', 3, @eng_id
WHERE @eng_id IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM COURSE
    WHERE Course_Name = 'BCA'
      AND Institute_ID = @eng_id
);

-- Add B.Tech under Engineering and Technology
INSERT INTO COURSE (Course_Name, Duration, Institute_ID)
SELECT 'B.Tech', 4, @eng_id
WHERE @eng_id IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM COURSE
    WHERE Course_Name = 'B.Tech'
      AND Institute_ID = @eng_id
);

-- Add BBA under Management
INSERT INTO COURSE (Course_Name, Duration, Institute_ID)
SELECT 'BBA', 3, @mgmt_id
WHERE @mgmt_id IS NOT NULL
AND NOT EXISTS (
    SELECT 1 FROM COURSE
    WHERE Course_Name = 'BBA'
      AND Institute_ID = @mgmt_id
);

-- Verify
SELECT
    C.Course_ID,
    C.Course_Name,
    C.Duration,
    I.Institute_Name
FROM COURSE C
JOIN INSTITUTE I
    ON C.Institute_ID = I.Institute_ID;
    

USE paper_Q;

-- 1. Programming-II (BCA)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'CS1135', 'Programming-II', 0, 1
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'CS1135'
);

-- 2. Game Design and Development (B.Tech)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'CS1227', 'Game Design and Development', 0, 2
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'CS1227'
);

-- 3. Accounting for Business (BCA)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'IL1104', 'Accounting for Business', 0, 1
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'IL1104'
);

-- 4. Linear Algebra and Differential Equations (B.Tech)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'AS1114', 'Linear Algebra and Differential Equations', 0, 2
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'AS1114'
);

-- 5. Industrial Safety Management (B.Tech)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'ME2101', 'Industrial Safety Management', 0, 2
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'ME2101'
);

-- 6. Services Marketing (BBA)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'MA1127', 'Services Marketing', 0, 3
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'MA1127'
);

-- 7. Sales in Retail Banking & Insurance (BBA)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'MA1106', 'Sales in Retail Banking & Insurance', 0, 3
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'MA1106'
);

-- 8. Consumer Behaviour & Brand Management in BFSI (BBA)
INSERT INTO SUBJECT
    (Subject_Code, Subject_Name, Credits, Course_ID)
SELECT 'MA1105', 'Consumer Behaviour & Brand Management in BFSI', 0, 3
WHERE NOT EXISTS (
    SELECT 1 FROM SUBJECT WHERE Subject_Code = 'MA1105'
);

-- Verify the subjects
SELECT
    S.Subject_Code,
    S.Subject_Name,
    S.Credits,
    C.Course_Name
FROM SUBJECT S
JOIN COURSE C ON S.Course_ID = C.Course_ID
ORDER BY C.Course_Name, S.Subject_Code;

