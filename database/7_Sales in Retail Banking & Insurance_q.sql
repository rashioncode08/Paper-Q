USE paper_Q;

-- PAPER 7: SALES IN RETAIL BANKING & INSURANCE
-- Subject_Code: MA1106
-- Paper_ID: 7
-- Maximum Marks: 30

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES

-- SECTION A: FILL IN THE BLANKS

(7, 1,
'Q.1.1 Fill in the blank: Sales Job Analysis is the process of determining the ______ and ______ of a sales job.',
1, NULL),

(7, 2,
'Q.1.2 Fill in the blank: The ______ method involves a pre-determined outline and lacks spontaneity.',
1, NULL),

(7, 3,
'Q.1.3 Fill in the blank: ______ is a training method that involves the use of role-playing, simulations, and case studies to help trainees learn how to handle real-life situations.',
1, NULL),

(7, 4,
'Q.1.4 Fill in the blank: The type of sales quota that is based on the historical sales data of a salesperson or a team is known as ______ quota.',
1, NULL),

(7, 5,
'Q.1.5 Fill in the blank: One of the challenges in managing sales territories is ______, which can occur when salespeople are assigned territories that are too large or too small.',
1, NULL),

-- SECTION A: TRUE / FALSE

(7, 6,
'Q.2.1 True or False: Sales job analysis is only useful for determining the salary of a salesperson.',
1, NULL),

(7, 7,
'Q.2.2 True or False: Recruitment is a one-time process that ends with the selection of a candidate for a job position.',
1, NULL),

(7, 8,
'Q.2.3 True or False: According to Herzberg''s Two Factor Theory, hygiene factors are the primary motivators for employees.',
1, NULL),

(7, 9,
'Q.2.4 True or False: The commission-only compensation plan is suitable for all types of sales roles.',
1, NULL),

(7, 10,
'Q.2.5 True or False: Motivation is a process that involves the desire to achieve a goal, the effort to work towards that goal, and the persistence to keep working towards it even in the face of obstacles.',
1, NULL),

-- SECTION B: DESCRIPTIVE QUESTIONS

(7, 11,
'Q.3.1 What are the advantages and disadvantages of internal and external recruitment, and how can an organization decide which method to use?',
3, NULL),

(7, 12,
'Q.3.2 Explain the different methods for determining the number of salespersons needed.',
3, NULL),

(7, 13,
'Q.4.1 There are several factors that can affect the success of sales training programs. In your opinion, which factor do you think is the most important and why? Provide at least two reasons to support your answer.',
4, NULL),

(7, 14,
'Q.4.2 How does the use of the Simple Ranking Method in compensation management affect employee motivation and job satisfaction?',
3, NULL),

(7, 15,
'Q.5.1 What are some theories of motivation that can be applied to sales force management?',
4, NULL),

(7, 16,
'Q.5.2 What are the different types of sales quotas and how do they differ from each other?',
3, NULL);

-- Verify inserted questions
SELECT
    Question_Number,
    Question_Text,
    Marks
FROM QUESTION
WHERE Paper_ID = 7
ORDER BY Question_Number;

-- Verify total marks
SELECT
    COUNT(*) AS Total_Questions,
    SUM(Marks) AS Total_Marks
FROM QUESTION
WHERE Paper_ID = 7;
