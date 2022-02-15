SELECT
    Hackers.hacker_id,
    Hackers.name
FROM Submissions
    INNER JOIN Challenges
    ON Submissions.challenge_id = Challenges.challenge_id
        INNER JOIN Difficulty
        ON Challenges.difficulty_level = Difficulty.difficulty_level
            INNER JOIN Hackers
            ON Submissions.hacker_id = Hackers.hacker_id
            AND Submissions.score = Difficulty.score
GROUP BY
    Hackers.hacker_id,
    Hackers.name
HAVING COUNT(Submissions.hacker_id)  > 1
ORDER BY 
    COUNT(Submissions.hacker_id) DESC,
    hacker_id ASC;