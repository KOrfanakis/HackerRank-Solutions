SELECT SUM(POPULATION) FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- Alternatively:

SELECT SUM(POPULATION) FROM CITY
GROUP BY COUNTRYCODE
HAVING COUNTRYCODE = 'JPN';