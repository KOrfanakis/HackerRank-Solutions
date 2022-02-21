SELECT
    Hackers.hacker_id,
    Hackers.name,
    SUM(Max_Submissions.max_score) AS 'total_score'
FROM Hackers
    INNER JOIN(
        SELECT hacker_id, challenge_id, MAX(score) AS 'max_score'
        FROM Submissions
        GROUP BY hacker_id, challenge_id
    ) AS Max_Submissions
    ON Hackers.hacker_id = Max_Submissions.hacker_id
GROUP BY Hackers.hacker_id, Hackers.name
HAVING total_score != 0
ORDER BY
    total_score DESC,
    Hackers.hacker_id ASC;