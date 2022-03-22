/*
Michael Placzek
CSC 355 Section 531
Assignment 4
2/1/2022
*/

-- 1
SELECT jID, name, rate, jobDate
FROM Job
JOIN Worker ON workerID = wID;

-- 2
SELECT Worker.name, region
FROM Job
JOIN Worker ON workerID = wID
JOIN Customer ON customerID = cID
WHERE city = 'Chicago';

--3
SELECT DISTINCT jobDate, MAX(hours)
FROM Job
GROUP BY jobDate
ORDER BY jobDate;

-- 4
SELECT jID, wID, to_char(hours * rate, 'L9G999D99') AS cost -- L9 is needed
FROM Job, Worker
WHERE wID = workerID;

-- 5
SELECT name
FROM Skill JOIN Qualification ON sID = skillID
GROUP BY name
ORDER BY name;

-- 6
SELECT name, customerID, jobDate
FROM Customer JOIN Job ON cID = customerID
WHERE jobDate < DATE '2021-10-01';

-- 7
SELECT workerID, Worker.name
FROM Qualification 
JOIN Skill ON skillID = sID
JOIN Worker ON workerID = wID
WHERE Skill.name = 'Plumbing';

-- 8
SELECT cID, city, COUNT(jID)
FROM Job RIGHT JOIN Customer ON cID = customerID
GROUP BY cID, city
ORDER BY COUNT(jID) DESC;
