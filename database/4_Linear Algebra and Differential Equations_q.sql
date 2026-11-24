USE paper_Q;

-- PAPER 4: LINEAR ALGEBRA AND DIFFERENTIAL EQUATIONS
-- Subject: AS1114
-- Paper_ID: 4
-- Maximum marks: 20

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES

(4, 1,
'True or False. If A and B are n x n row equivalent matrices, then they have the same eigenvalues. Justify your answer.',
1, NULL),

(4, 2,
'Geometrically describe the linear transformation T: R^2 -> R^2 defined by T([x1, x2]^T) = [k*x1, x2]^T, where k is a real number. If R is a unit square, find and sketch its image under T for k = 3.',
1, NULL),

(4, 3,
'Find the eigenvalues of the given upper triangular matrix A = [[1/4, 21, 34, 0], [0, -1, 7, 8], [0, 0, 3, 41], [0, 0, 0, -2]]. Using the eigenvalues of A, find the eigenvalues of -A^T and (A + 2I)^(-1), if they exist.',
1.5, NULL),

(4, 4,
'Check whether the transformation T: P1 -> P2 defined by T(p(t)) = t*p(t) + p(0) is linear.',
2, NULL),

(4, 5,
'Determine whether the vector v = [2, 1, 8]^T in R^3 belongs to the span of v1 = [1, 1, 0]^T, v2 = [1, 0, 1]^T, and v3 = [0, 1, -1]^T. Give details.',
2, NULL),

(4, 6,
'Check whether the set of vectors {t^2 + t + 1, 3t^2 + 2t + 1, t^2 + 1} in P2 is linearly independent.',
2, NULL),

(4, 7,
'Find the nullity of the linear transformation T: R^2 -> R^3 defined by T([x, y]^T) = [x + y, x - y, y]^T.',
1.5, NULL),

(4, 8,
'A 3 x 3 Toeplitz matrix has the form [[a, b, c], [d, a, b], [e, d, a]]. A 3 x 3 circulant matrix has the form [[a, b, c], [c, a, b], [b, c, a]]. Find a basis and dimension for each space, and determine the dimension of the space of all n x n Toeplitz matrices.',
3, NULL),

(4, 9,
'Let T: R^4 -> R^3 be defined by T([x1, x2, x3, x4]^T) = [x1 - x2 + 2x3 + 3x4, x2 + x3, x1 + 3x3 + 3x4]^T. Find the standard matrix for T, a basis for its range, a basis for its kernel, and verify the rank theorem.',
2.5, NULL),

(4, 10,
'For A = [[2, 1, 1], [0, 2, 0], [0, -1, 1]], find a basis for the eigenspace associated with lambda = 2. Further, using this information, determine the remaining eigenvalues without explicitly writing the characteristic equation.',
3, NULL);

-- Verify inserted questions
SELECT
    Question_Number,
    Question_Text,
    Marks
FROM QUESTION
WHERE Paper_ID = 4
ORDER BY Question_Number;

-- Verify the total marks
SELECT
    COUNT(*) AS Total_Questions,
    SUM(Marks) AS Total_Marks
FROM QUESTION
WHERE Paper_ID = 4;
