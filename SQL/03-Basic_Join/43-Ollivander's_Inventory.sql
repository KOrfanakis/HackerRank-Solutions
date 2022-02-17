SELECT 
    Wands.id,
    Wands_Property.age,
    Wands.coins_needed,
    Wands.power
FROM Wands
    INNER JOIN Wands_Property
    ON Wands.code = Wands_Property.code
WHERE Wands_Property.is_evil = 0
AND Wands.coins_needed = (
    SELECT MIN(Wands_2.coins_needed) 
    FROM Wands AS Wands_2
        INNER JOIN Wands_Property AS Wands_Property_2 
        ON Wands_2.code = Wands_Property_2.code
    WHERE  Wands_Property.age = Wands_Property_2.age 
    AND Wands.power = Wands_2.power
    ) 
ORDER BY
    Wands.power DESC, 
    Wands_Property.age DESC;