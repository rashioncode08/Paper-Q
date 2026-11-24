USE paper_Q;

-- GAME DESIGN AND DEVELOPMENT
-- Paper_ID = 2
-- Subject_Code = CS1227
-- Maximum Marks = 30

INSERT INTO QUESTION
    (Paper_ID, Question_Number, Question_Text, Marks, Difficulty_Level)
VALUES

(2, 1,
' Differentiate between "colliders" and "triggers" in Unity physics. When would you use one over the other?',
5, NULL),

(2, 2,
' A Unity UI canvas is designed for a resolution of 1920x1080 pixels. If the game is running on a mobile with a resolution of 1280x720 pixels, calculate the scaling factor needed to adjust the UI elements appropriately.',
5, NULL),

(2, 3,
' Estimate the bandwidth usage for a Unity multiplayer game with 8 players, assuming each player sends 2 KB of data per second to the server, and the server sends 3 KB of data to each player per second.',
5, NULL),

(2, 4,
' Explain techniques for optimizing the performance of a Unity game. Provide examples of how to use the Unity Profiler to identify and address performance bottlenecks.',
5, NULL),

(2, 5,
' In C#, what is the purpose of the "readonly" keyword, and how does it differ from the "const" keyword? Provide an example of when you might use one over the other in Unity scripting.',
5, NULL),

(2, 6,
' OPTION A: Given a Unity script with a logical error causing unexpected behavior, describe how you would approach debugging and fixing the issue. Include the use of Unity debugging tools and common debugging techniques.

OR

OPTION B: Write a simple Unity shader that creates a toon shading effect for a 3D model. Explain the logic behind the shader and how it achieves the stylized look.',
5, NULL);

-- Verify the complete paper
SELECT
    Paper_ID,
    Question_Number,
    Question_Text,
    Marks
FROM QUESTION
WHERE Paper_ID = 2
ORDER BY Question_Number;

-- Check total marks
SELECT
    COUNT(*) AS Total_Questions,
    SUM(Marks) AS Total_Marks
FROM QUESTION
WHERE Paper_ID = 2;
