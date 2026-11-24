USE paper_Q;

-- PAPER 8: CONSUMER BEHAVIOUR & BRAND MANAGEMENT IN BFSI
-- Paper_ID = 8
-- Subject_Code = MA1105
-- BBA Semester V
-- Maximum Marks = 30

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES

-- SECTION A: FILL IN THE BLANKS

(8, 1,
'Q.1.1 Fill in the blank: The ______ test is a research method that involves presenting a list of words or phrases to respondents and asking them to provide the first word or phrase that comes to mind.',
1, NULL),

(8, 2,
'Q.1.2 Fill in the blank: ______ is the term used to describe the added value a brand name gives to a product beyond the functional benefits it provides.',
1, NULL),

(8, 3,
'Q.1.3 Fill in the blank: Protective and fighter brands are also known as ______ brands.',
1, NULL),

(8, 4,
'Q.1.4 Fill in the blank: The extent to which customers use the brand, talk to others about the brand, and seek out brand information is known as ______.',
1, NULL),

(8, 5,
'Q.1.5 Fill in the blank: The customer-based brand equity model (Brand Resonance Model) was given by ______.',
1, NULL),

-- SECTION A: TRUE / FALSE

(8, 6,
'Q.2.1 True or False: The potential product is the lowest level in the consumer value hierarchy.',
1, NULL),

(8, 7,
'Q.2.2 True or False: Creating brand extensions can reduce the risk perceived by customers.',
1, NULL),

(8, 8,
'Q.2.3 True or False: Brand architecture is the process of designing and implementing brand strategies that maximize a firm''s long-term brand equity.',
1, NULL),

(8, 9,
'Q.2.4 True or False: The spandex rule, "Just because you can does not mean you should," is related to brand boundaries.',
1, NULL),

(8, 10,
'Q.2.5 True or False: According to the Brand Value Chain, brand value creation begins when a firm invests in a marketing program targeting actual or potential customers.',
1, NULL),

-- SECTION B: DESCRIPTIVE QUESTIONS

(8, 11,
'Q.3.1 You are a marketing manager for a new startup. How can branding benefit your company and its customers?',
3, NULL),

(8, 12,
'Q.3.2 What are some examples of negatively co-related points of parity and points of difference?',
3, NULL),

(8, 13,
'Q.4.1 What is the customer-based brand equity model and how does it work?',
4, NULL),

(8, 14,
'Q.4.2 How can a company apply the criteria for choosing brand elements to create a new brand name for a product?',
3, NULL),

(8, 15,
'Q.5.1 Identify a company that has organised its brand architecture using multiple levels in the hierarchy. Explain the terms Brand Extension, Line Extension, House of Brands and Branded House in context to your example.',
4, NULL),

(8, 16,
'Q.5.2 What factors must be considered while retiring a brand? Explain.',
3, NULL);

-- Verify inserted questions
SELECT
    Question_Number,
    Question_Text,
    Marks
FROM QUESTION
WHERE Paper_ID = 8
ORDER BY Question_Number;

-- Verify total marks
SELECT
    COUNT(*) AS Total_Questions,
    SUM(Marks) AS Total_Marks
FROM QUESTION
WHERE Paper_ID = 8;
