-- Programming-II question

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES
(1, 1,
 'Answer the following: Explain the stages of building a C program and state at which stage macros defined by #define are expanded.',
 2, NULL),

(1, 2,
 'Consider the given C program using the TEST(a) macro, the function declaration func, and variables a, b and c. Answer the questions about compilation, errors and macro expansion.',
 4, NULL),

(1, 3,
 'Determine the values of a and b after running the given C code snippets.',
 4, NULL),

(1, 4,
 'For the given Person structure, array of persons and pointers, determine whether each printf statement compiles and what it prints.',
 3, NULL);

SELECT *
FROM QUESTION
WHERE Paper_ID = 1
ORDER BY Question_Number;

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES
(1, 5,
 'Determine the output of the given C program involving global variables, a function parameter, and a static local variable.',
 4, NULL),

(1, 6,
 'Complete the given C code involving string pointers and an array of strings. Then determine the results of the specified printf statements.',
 4, NULL),

(1, 7,
 'Write C programs to find the closest perfect square to an integer, compute the specified sum up to 25 terms, and calculate the sum of each column of a 7 by 7 integer matrix.',
 9, NULL);

SELECT *
FROM QUESTION
WHERE Paper_ID = 1
ORDER BY Question_Number;

