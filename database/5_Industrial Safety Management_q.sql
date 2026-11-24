USE paper_Q;

-- PAPER 5: INDUSTRIAL SAFETY MANAGEMENT
-- Paper_ID = 5
-- Subject_Code = ME2101
-- Maximum marks = 30
-- Duration = 150 minutes

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES
(5, 1, 'Answer questions 1.1 to 1.3 on injury classification, accident prevention, and accident investigation.', 5, NULL),
(5, 2, 'Answer questions 2.1 to 2.3 on safety throughout the system life cycle, safety inspections and audits, and first aid.', 5, NULL),
(5, 3, 'Answer questions 3.1 to 3.3 on human factors, HSE policy, and industrial risk management.', 5, NULL),
(5, 4, 'Answer questions 4.1 to 4.3 on mock drills, disaster preparedness, and industrial disaster management. Question 4.3 has an alternative.', 5, NULL),
(5, 5, 'Answer questions 5.1 to 5.3 on industrial accident prevention and safety management systems. Question 5.3 has an alternative.', 10, NULL);

INSERT INTO SUB_PART
    (Paper_ID, Question_Number, Sub_Part_Number, Sub_Part_Text, Marks)
VALUES

-- QUESTION 1
(5, 1, '1.1',
'Classify injuries based on severity and impact on work performance. How do these classifications influence reporting procedures?', 1.5),

(5, 1, '1.2',
'How can organizations effectively mitigate and address unsafe acts and conditions to prevent accidents?', 1.5),

(5, 1, '1.3',
'Outline the essential components of an accident investigation process. How does it contribute to improving safety measures?', 2),

-- QUESTION 2
(5, 2, '2.1',
'Elaborate on the integration of safety measures across the entire system life cycle. How does a comprehensive system safety program aid in preemptively addressing potential hazards and risks at each stage of development and deployment?', 2),

(5, 2, '2.2',
'Distinguish between plant safety inspections and safety audits. How do these processes contribute to maintaining a safe working environment?', 1.5),

(5, 2, '2.3',
'Outline the fundamental principles, aims, and objectives of providing first aid in the event of an accident.', 1.5),

-- QUESTION 3
(5, 3, '3.1',
'Analyze the role of human factors in safety management. How can an understanding of these factors aid in accident prevention?', 1.5),

(5, 3, '3.2',
'Analyze the critical components of a robust Health, Safety, and Environment (HSE) policy. How does such a policy align with and reinforce an organization''s risk management strategies?', 1.5),

(5, 3, '3.3',
'Compare and contrast various risk management techniques and strategies utilized in industrial settings. How do these techniques contribute to comprehensive risk management programs aimed at minimizing potential threats and hazards?', 2),

-- QUESTION 4
(5, 4, '4.1',
'Assess the importance of conducting mock drills and having specific oil spill contingency plans. Explain how these proactive measures help in readiness and mitigation during emergencies.', 2),

(5, 4, '4.2',
'Explore the significance of disaster preparedness in industrial contexts. Differentiate between various types of disasters, including industrial and natural, and their potential impacts on occupational health and safety.', 2.5),

(5, 4, '4.3a',
'Detail the legal obligations and responsibilities of industries regarding disaster management and mitigation. Evaluate the efficacy of current legal provisions in ensuring prompt responses and adequate support post-disaster.', 3),

(5, 4, '4.3b',
'Alternative: Examine significant industrial disasters in history, citing examples and analyzing their causes, impacts, and subsequent changes in safety regulations or practices.', 3),

-- QUESTION 5
(5, 5, '5.1',
'How can industrial processes and safety measures be redefined or enhanced to prevent catastrophic accidents like the Bhopal gas tragedy from occurring in the future?', 2),

(5, 5, '5.2',
'How can a comprehensive safety management system be established and implemented to effectively anticipate, mitigate, and prevent potential hazards such as gas-cutting accidents, equipment malfunctions, and structural failures?', 2.5),

(5, 5, '5.3a',
'How can a comprehensive safety management system be established and implemented to effectively anticipate, mitigate, and prevent potential hazards such as structural failures and inadequate supervision?', 3),

(5, 5, '5.3b',
'Alternative: Discuss the critical components of on-site and off-site emergency plans in industrial settings. Highlight the strategies, protocols, and coordination required for effective crisis management.', 3);

-- Verify inserted content
SELECT *
FROM QUESTION
WHERE Paper_ID = 5
ORDER BY Question_Number;

SELECT *
FROM SUB_PART
WHERE Paper_ID = 5
ORDER BY Question_Number, Sub_Part_Number;
