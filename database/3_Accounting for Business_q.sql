USE paper_Q;

-- PAPER 3: ACCOUNTING FOR BUSINESS
-- Subject: IL1104
-- Maximum Marks: 30

INSERT INTO QUESTION
(Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES
(3, 1,
 'Answer the following short questions on accounting concepts.',
 10, NULL),

(3, 2,
 'Enter the transactions of VK Traders for December 2023 in the journal and post them into the ledger.',
 10, NULL),

(3, 3,
 'Answer questions on final accounts and preparation of a trading account.',
 10, NULL);

-- add subpart

INSERT INTO SUB_PART
(Paper_ID, Question_Number, Sub_Part_Number, Sub_Part_Text, Marks)
VALUES

(3, 1, '1.1',
 'What are the various interested parties which use accounting information? How is such information used?',
 2),

(3, 1, '1.2',
 'Explain Cost accounting and accrual accounting.',
 2),

(3, 1, '1.3',
 'Discuss dual aspect concept.',
 2),

(3, 1, '1.4',
 'What is a trial balance? Explain its objectives.',
 2),

(3, 1, '1.5',
 'A debit balance of profit and loss account is: a) Net Loss b) Gross Profit c) Gross Loss d) Net Profit.',
 2),

(3, 2, '2.1',
 'Enter the following transactions in the journal of VK Traders for December 2023 and post them into ledger:
Dec 1: Arun commenced his business with a capital of 10,000.
Dec 1: Bought furniture 3,000.
Dec 2: Bought goods for cash from Ram 500.
Dec 3: Purchased goods from Jai on credit 2,200.
Dec 4: Cash sales to Hari 2,000.
Dec 5: Credit sales to Marie 3,200.
Dec 8: Bought more furniture for cash from A Ltd. 1,050.
Dec 18: Paid advertisement expenses to Sunil Agencies 200.
Dec 19: Received interest from Anil 50.
Dec 20: Deposited cash into bank 1,000.',
 10),

(3, 3, '3.1',
 'What are Final Accounts? What are the major components of all 3 accounts and what purpose do they serve?',
 5),

(3, 3, '3.2',
 'From the following balances taken from the Trial Balance of Shri Suresh, prepare a Trading account and show the gross profit/loss:

Stock on 1.1.2023: 2,000
Purchases and Sales: 20,000
Carriage: 1,000
Office Rent: 1,000
Interest received: 2,000
Salaries: 2,000
Sales: 10,000
Discount: 500
Insurance: 500
Stock on 31.2.2023: 5,000.',
 5);

SELECT
    Q.Question_Number,
    S.Sub_Part_Number,
    S.Sub_Part_Text,
    S.Marks
FROM QUESTION Q
JOIN SUB_PART S
    ON Q.Paper_ID = S.Paper_ID
    AND Q.Question_Number = S.Question_Number
WHERE Q.Paper_ID = 3
ORDER BY Q.Question_Number, S.Sub_Part_Number;