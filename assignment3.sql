/*
Michael Placzek
CSC 355 Section 531
Assignment 3
1/25/2022
*/

-- 1
SELECT DISTINCT insurance
FROM Patient
ORDER BY insurance;

-- 2
SELECT name, city 
FROM Hospital
ORDER BY capacity DESC;

-- 3
SELECT patientID
FROM Visit
WHERE dischargeDate > DATE '2020-01-01';

-- 4
SELECT name
FROM Patient
WHERE name LIKE '%, Sue%';

-- 5
SELECT city, COUNT(city)
FROM Hospital
GROUP BY city
ORDER BY COUNT(city) DESC;

-- 6
SELECT patientID, SUM(charge)
FROM Visit
GROUP BY patientID
ORDER BY SUM(charge);

-- 7
SELECT admitDate, COUNT(admitDate)
FROM Visit
GROUP BY admitDate
HAVING COUNT(admitDate) >= 3;

-- 8
SELECT name, city, charge
FROM Visit INNER JOIN Hospital ON
    hospitalID=HID
WHERE patientID = 'P444';