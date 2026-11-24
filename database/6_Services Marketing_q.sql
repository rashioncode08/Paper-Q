USE paper_Q;

-- PAPER 6: SERVICES MARKETING
-- Paper_ID = 6
-- Subject_Code = MA1127
-- Maximum Marks = 30

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES

(6, 1,
'Q.1.1: Think about a service you receive. Is there a gap between your expectations and perceptions of that service? What do you expect that you do not receive?',
3, NULL),

(6, 2,
'Q.1.2: Which of the provider gaps do you believe is hardest to close? Why?',
3, NULL),

(6, 3,
'Q.2.1: What are some common types of service guarantees that companies offer? When should a company not offer a service guarantee?',
3, NULL),

(6, 4,
'Q.2.2 (labelled Q.2.1 in the source): What are the factors that attract customers to use online services? What are the key factors that help keep facilities open for 24x7x365?',
3, NULL),

(6, 5,
'Q.3.1: Give five research objectives that must be established before customer research is conducted. In what situation does a service company need requirement research?',
3, NULL),

(6, 6,
'Q.3.2: Describe how a firm''s relationships with customers may evolve over time. What are the benefits of relationships to the customer and the company?',
3, NULL),

(6, 7,
'Q.4.1: What is service innovation? Discuss with your own example as a customer where you have come across service innovations.',
3, NULL),

(6, 8,
'Q.4.2: What is the difference between hard and soft standards? Which do you think would be more readily accepted by employees? By management? Why?',
3, NULL),

(6, 9,
'Q.5.1: Describe and give an example of how servicescapes play each of the following strategic roles: Package, Facilitator, Socialiser, and Differentiator.',
3, NULL),

(6, 10,
'Q.5.2: How can an effective physical evidence strategy help close provider gap 2? Explain how your decision gets affected by physical evidence of the service facility.',
3, NULL);

-- Verify the paper
SELECT
    Question_Number,
    Question_Text,
    Marks
FROM QUESTION
WHERE Paper_ID = 6
ORDER BY Question_Number;

-- Check total marks
SELECT
    COUNT(*) AS Total_Questions,
    SUM(Marks) AS Total_Marks
FROM QUESTION
WHERE Paper_ID = 6;
