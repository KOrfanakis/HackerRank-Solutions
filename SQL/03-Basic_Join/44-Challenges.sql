SELECT
    Hackers.hacker_id,
    Hackers.name,
    COUNT(Challenges.challenge_id) AS total_count
FROM Hackers
    INNER JOIN Challenges
    ON Hackers.hacker_id = Challenges.hacker_id
GROUP BY Hackers.hacker_id, Hackers.name
HAVING
    total_count = (
        SELECT COUNT(temp1.challenge_id) AS max_count
        FROM Challenges AS temp1
        GROUP BY temp1.hacker_id
        ORDER BY max_count DESC
        LIMIT 1
        )
    OR
    total_count IN (
        SELECT DISTINCT other_counts 
        FROM (
            SELECT 
                h2.hacker_id, 
                h2.name, 
                COUNT(c2.challenge_id) AS other_counts
            FROM Hackers AS h2 
                JOIN CHALLENGES AS c2
                ON h2.hacker_id = c2.hacker_id
            GROUP BY 
                h2.hacker_id, h2.name
        ) AS temp2
        GROUP BY other_counts
        HAVING COUNT(other_counts) = 1
    )
ORDER BY
    COUNT(challenge_id) DESC,
    Hackers.hacker_id
;